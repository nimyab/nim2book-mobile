// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponse {

 String get accessToken; String get refreshToken; User get user;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'LoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? user = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  User user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  User user)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  User user)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({required this.accessToken, required this.refreshToken, required this.user});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
@override final  User user;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'LoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? user = null,}) {
  return _then(_LoginResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$GoogleLoginResponse {

 String get accessToken; String get refreshToken; User get user;
/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleLoginResponseCopyWith<GoogleLoginResponse> get copyWith => _$GoogleLoginResponseCopyWithImpl<GoogleLoginResponse>(this as GoogleLoginResponse, _$identity);

  /// Serializes this GoogleLoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleLoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'GoogleLoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class $GoogleLoginResponseCopyWith<$Res>  {
  factory $GoogleLoginResponseCopyWith(GoogleLoginResponse value, $Res Function(GoogleLoginResponse) _then) = _$GoogleLoginResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$GoogleLoginResponseCopyWithImpl<$Res>
    implements $GoogleLoginResponseCopyWith<$Res> {
  _$GoogleLoginResponseCopyWithImpl(this._self, this._then);

  final GoogleLoginResponse _self;
  final $Res Function(GoogleLoginResponse) _then;

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? user = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoogleLoginResponse].
extension GoogleLoginResponsePatterns on GoogleLoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleLoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleLoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _GoogleLoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleLoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  User user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  User user)  $default,) {final _that = this;
switch (_that) {
case _GoogleLoginResponse():
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  User user)?  $default,) {final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleLoginResponse implements GoogleLoginResponse {
  const _GoogleLoginResponse({required this.accessToken, required this.refreshToken, required this.user});
  factory _GoogleLoginResponse.fromJson(Map<String, dynamic> json) => _$GoogleLoginResponseFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
@override final  User user;

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleLoginResponseCopyWith<_GoogleLoginResponse> get copyWith => __$GoogleLoginResponseCopyWithImpl<_GoogleLoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleLoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleLoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'GoogleLoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class _$GoogleLoginResponseCopyWith<$Res> implements $GoogleLoginResponseCopyWith<$Res> {
  factory _$GoogleLoginResponseCopyWith(_GoogleLoginResponse value, $Res Function(_GoogleLoginResponse) _then) = __$GoogleLoginResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$GoogleLoginResponseCopyWithImpl<$Res>
    implements _$GoogleLoginResponseCopyWith<$Res> {
  __$GoogleLoginResponseCopyWithImpl(this._self, this._then);

  final _GoogleLoginResponse _self;
  final $Res Function(_GoogleLoginResponse) _then;

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? user = null,}) {
  return _then(_GoogleLoginResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RegisterResponse {

 bool get success;
/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResponseCopyWith<RegisterResponse> get copyWith => _$RegisterResponseCopyWithImpl<RegisterResponse>(this as RegisterResponse, _$identity);

  /// Serializes this RegisterResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'RegisterResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $RegisterResponseCopyWith<$Res>  {
  factory $RegisterResponseCopyWith(RegisterResponse value, $Res Function(RegisterResponse) _then) = _$RegisterResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._self, this._then);

  final RegisterResponse _self;
  final $Res Function(RegisterResponse) _then;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterResponse].
extension RegisterResponsePatterns on RegisterResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResponse value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _RegisterResponse():
return $default(_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterResponse implements RegisterResponse {
  const _RegisterResponse({required this.success});
  factory _RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

@override final  bool success;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResponseCopyWith<_RegisterResponse> get copyWith => __$RegisterResponseCopyWithImpl<_RegisterResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'RegisterResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$RegisterResponseCopyWith<$Res> implements $RegisterResponseCopyWith<$Res> {
  factory _$RegisterResponseCopyWith(_RegisterResponse value, $Res Function(_RegisterResponse) _then) = __$RegisterResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$RegisterResponseCopyWithImpl<$Res>
    implements _$RegisterResponseCopyWith<$Res> {
  __$RegisterResponseCopyWithImpl(this._self, this._then);

  final _RegisterResponse _self;
  final $Res Function(_RegisterResponse) _then;

/// Create a copy of RegisterResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_RegisterResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$RefreshResponse {

 String get accessToken; String get refreshToken;
/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshResponseCopyWith<RefreshResponse> get copyWith => _$RefreshResponseCopyWithImpl<RefreshResponse>(this as RefreshResponse, _$identity);

  /// Serializes this RefreshResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'RefreshResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RefreshResponseCopyWith<$Res>  {
  factory $RefreshResponseCopyWith(RefreshResponse value, $Res Function(RefreshResponse) _then) = _$RefreshResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class _$RefreshResponseCopyWithImpl<$Res>
    implements $RefreshResponseCopyWith<$Res> {
  _$RefreshResponseCopyWithImpl(this._self, this._then);

  final RefreshResponse _self;
  final $Res Function(RefreshResponse) _then;

/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshResponse].
extension RefreshResponsePatterns on RefreshResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefreshResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _RefreshResponse():
return $default(_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshResponse implements RefreshResponse {
  const _RefreshResponse({required this.accessToken, required this.refreshToken});
  factory _RefreshResponse.fromJson(Map<String, dynamic> json) => _$RefreshResponseFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;

/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshResponseCopyWith<_RefreshResponse> get copyWith => __$RefreshResponseCopyWithImpl<_RefreshResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'RefreshResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshResponseCopyWith<$Res> implements $RefreshResponseCopyWith<$Res> {
  factory _$RefreshResponseCopyWith(_RefreshResponse value, $Res Function(_RefreshResponse) _then) = __$RefreshResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class __$RefreshResponseCopyWithImpl<$Res>
    implements _$RefreshResponseCopyWith<$Res> {
  __$RefreshResponseCopyWithImpl(this._self, this._then);

  final _RefreshResponse _self;
  final $Res Function(_RefreshResponse) _then;

/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_RefreshResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LogoutResponse {

 bool get success;
/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutResponseCopyWith<LogoutResponse> get copyWith => _$LogoutResponseCopyWithImpl<LogoutResponse>(this as LogoutResponse, _$identity);

  /// Serializes this LogoutResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'LogoutResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $LogoutResponseCopyWith<$Res>  {
  factory $LogoutResponseCopyWith(LogoutResponse value, $Res Function(LogoutResponse) _then) = _$LogoutResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$LogoutResponseCopyWithImpl<$Res>
    implements $LogoutResponseCopyWith<$Res> {
  _$LogoutResponseCopyWithImpl(this._self, this._then);

  final LogoutResponse _self;
  final $Res Function(LogoutResponse) _then;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutResponse].
extension LogoutResponsePatterns on LogoutResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutResponse value)  $default,){
final _that = this;
switch (_that) {
case _LogoutResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _LogoutResponse():
return $default(_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutResponse implements LogoutResponse {
  const _LogoutResponse({required this.success});
  factory _LogoutResponse.fromJson(Map<String, dynamic> json) => _$LogoutResponseFromJson(json);

@override final  bool success;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutResponseCopyWith<_LogoutResponse> get copyWith => __$LogoutResponseCopyWithImpl<_LogoutResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'LogoutResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$LogoutResponseCopyWith<$Res> implements $LogoutResponseCopyWith<$Res> {
  factory _$LogoutResponseCopyWith(_LogoutResponse value, $Res Function(_LogoutResponse) _then) = __$LogoutResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$LogoutResponseCopyWithImpl<$Res>
    implements _$LogoutResponseCopyWith<$Res> {
  __$LogoutResponseCopyWithImpl(this._self, this._then);

  final _LogoutResponse _self;
  final $Res Function(_LogoutResponse) _then;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_LogoutResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MeResponse {

 User get user;
/// Create a copy of MeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeResponseCopyWith<MeResponse> get copyWith => _$MeResponseCopyWithImpl<MeResponse>(this as MeResponse, _$identity);

  /// Serializes this MeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'MeResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class $MeResponseCopyWith<$Res>  {
  factory $MeResponseCopyWith(MeResponse value, $Res Function(MeResponse) _then) = _$MeResponseCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$MeResponseCopyWithImpl<$Res>
    implements $MeResponseCopyWith<$Res> {
  _$MeResponseCopyWithImpl(this._self, this._then);

  final MeResponse _self;
  final $Res Function(MeResponse) _then;

/// Create a copy of MeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of MeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [MeResponse].
extension MeResponsePatterns on MeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeResponse value)  $default,){
final _that = this;
switch (_that) {
case _MeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeResponse() when $default != null:
return $default(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User user)  $default,) {final _that = this;
switch (_that) {
case _MeResponse():
return $default(_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User user)?  $default,) {final _that = this;
switch (_that) {
case _MeResponse() when $default != null:
return $default(_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeResponse implements MeResponse {
  const _MeResponse({required this.user});
  factory _MeResponse.fromJson(Map<String, dynamic> json) => _$MeResponseFromJson(json);

@override final  User user;

/// Create a copy of MeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeResponseCopyWith<_MeResponse> get copyWith => __$MeResponseCopyWithImpl<_MeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'MeResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class _$MeResponseCopyWith<$Res> implements $MeResponseCopyWith<$Res> {
  factory _$MeResponseCopyWith(_MeResponse value, $Res Function(_MeResponse) _then) = __$MeResponseCopyWithImpl;
@override @useResult
$Res call({
 User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$MeResponseCopyWithImpl<$Res>
    implements _$MeResponseCopyWith<$Res> {
  __$MeResponseCopyWithImpl(this._self, this._then);

  final _MeResponse _self;
  final $Res Function(_MeResponse) _then;

/// Create a copy of MeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_MeResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of MeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$GetBooksResponse {

 List<Book> get books;
/// Create a copy of GetBooksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetBooksResponseCopyWith<GetBooksResponse> get copyWith => _$GetBooksResponseCopyWithImpl<GetBooksResponse>(this as GetBooksResponse, _$identity);

  /// Serializes this GetBooksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBooksResponse&&const DeepCollectionEquality().equals(other.books, books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(books));

@override
String toString() {
  return 'GetBooksResponse(books: $books)';
}


}

/// @nodoc
abstract mixin class $GetBooksResponseCopyWith<$Res>  {
  factory $GetBooksResponseCopyWith(GetBooksResponse value, $Res Function(GetBooksResponse) _then) = _$GetBooksResponseCopyWithImpl;
@useResult
$Res call({
 List<Book> books
});




}
/// @nodoc
class _$GetBooksResponseCopyWithImpl<$Res>
    implements $GetBooksResponseCopyWith<$Res> {
  _$GetBooksResponseCopyWithImpl(this._self, this._then);

  final GetBooksResponse _self;
  final $Res Function(GetBooksResponse) _then;

/// Create a copy of GetBooksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? books = null,}) {
  return _then(_self.copyWith(
books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetBooksResponse].
extension GetBooksResponsePatterns on GetBooksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetBooksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetBooksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetBooksResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetBooksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetBooksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetBooksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Book> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetBooksResponse() when $default != null:
return $default(_that.books);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Book> books)  $default,) {final _that = this;
switch (_that) {
case _GetBooksResponse():
return $default(_that.books);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Book> books)?  $default,) {final _that = this;
switch (_that) {
case _GetBooksResponse() when $default != null:
return $default(_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetBooksResponse implements GetBooksResponse {
  const _GetBooksResponse({required final  List<Book> books}): _books = books;
  factory _GetBooksResponse.fromJson(Map<String, dynamic> json) => _$GetBooksResponseFromJson(json);

 final  List<Book> _books;
@override List<Book> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of GetBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetBooksResponseCopyWith<_GetBooksResponse> get copyWith => __$GetBooksResponseCopyWithImpl<_GetBooksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetBooksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetBooksResponse&&const DeepCollectionEquality().equals(other._books, _books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'GetBooksResponse(books: $books)';
}


}

/// @nodoc
abstract mixin class _$GetBooksResponseCopyWith<$Res> implements $GetBooksResponseCopyWith<$Res> {
  factory _$GetBooksResponseCopyWith(_GetBooksResponse value, $Res Function(_GetBooksResponse) _then) = __$GetBooksResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Book> books
});




}
/// @nodoc
class __$GetBooksResponseCopyWithImpl<$Res>
    implements _$GetBooksResponseCopyWith<$Res> {
  __$GetBooksResponseCopyWithImpl(this._self, this._then);

  final _GetBooksResponse _self;
  final $Res Function(_GetBooksResponse) _then;

/// Create a copy of GetBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? books = null,}) {
  return _then(_GetBooksResponse(
books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<Book>,
  ));
}


}


/// @nodoc
mixin _$GetBookResponse {

 Book get book;
/// Create a copy of GetBookResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetBookResponseCopyWith<GetBookResponse> get copyWith => _$GetBookResponseCopyWithImpl<GetBookResponse>(this as GetBookResponse, _$identity);

  /// Serializes this GetBookResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'GetBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class $GetBookResponseCopyWith<$Res>  {
  factory $GetBookResponseCopyWith(GetBookResponse value, $Res Function(GetBookResponse) _then) = _$GetBookResponseCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$GetBookResponseCopyWithImpl<$Res>
    implements $GetBookResponseCopyWith<$Res> {
  _$GetBookResponseCopyWithImpl(this._self, this._then);

  final GetBookResponse _self;
  final $Res Function(GetBookResponse) _then;

/// Create a copy of GetBookResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,}) {
  return _then(_self.copyWith(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}
/// Create a copy of GetBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetBookResponse].
extension GetBookResponsePatterns on GetBookResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetBookResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetBookResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetBookResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetBookResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetBookResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetBookResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Book book)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetBookResponse() when $default != null:
return $default(_that.book);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Book book)  $default,) {final _that = this;
switch (_that) {
case _GetBookResponse():
return $default(_that.book);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Book book)?  $default,) {final _that = this;
switch (_that) {
case _GetBookResponse() when $default != null:
return $default(_that.book);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetBookResponse implements GetBookResponse {
  const _GetBookResponse({required this.book});
  factory _GetBookResponse.fromJson(Map<String, dynamic> json) => _$GetBookResponseFromJson(json);

@override final  Book book;

/// Create a copy of GetBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetBookResponseCopyWith<_GetBookResponse> get copyWith => __$GetBookResponseCopyWithImpl<_GetBookResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetBookResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'GetBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class _$GetBookResponseCopyWith<$Res> implements $GetBookResponseCopyWith<$Res> {
  factory _$GetBookResponseCopyWith(_GetBookResponse value, $Res Function(_GetBookResponse) _then) = __$GetBookResponseCopyWithImpl;
@override @useResult
$Res call({
 Book book
});


@override $BookCopyWith<$Res> get book;

}
/// @nodoc
class __$GetBookResponseCopyWithImpl<$Res>
    implements _$GetBookResponseCopyWith<$Res> {
  __$GetBookResponseCopyWithImpl(this._self, this._then);

  final _GetBookResponse _self;
  final $Res Function(_GetBookResponse) _then;

/// Create a copy of GetBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(_GetBookResponse(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of GetBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// @nodoc
mixin _$TranslateBookResponse {

 Book? get book; String? get messageAboutTranslate;
/// Create a copy of TranslateBookResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslateBookResponseCopyWith<TranslateBookResponse> get copyWith => _$TranslateBookResponseCopyWithImpl<TranslateBookResponse>(this as TranslateBookResponse, _$identity);

  /// Serializes this TranslateBookResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslateBookResponse&&(identical(other.book, book) || other.book == book)&&(identical(other.messageAboutTranslate, messageAboutTranslate) || other.messageAboutTranslate == messageAboutTranslate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,messageAboutTranslate);

@override
String toString() {
  return 'TranslateBookResponse(book: $book, messageAboutTranslate: $messageAboutTranslate)';
}


}

/// @nodoc
abstract mixin class $TranslateBookResponseCopyWith<$Res>  {
  factory $TranslateBookResponseCopyWith(TranslateBookResponse value, $Res Function(TranslateBookResponse) _then) = _$TranslateBookResponseCopyWithImpl;
@useResult
$Res call({
 Book? book, String? messageAboutTranslate
});


$BookCopyWith<$Res>? get book;

}
/// @nodoc
class _$TranslateBookResponseCopyWithImpl<$Res>
    implements $TranslateBookResponseCopyWith<$Res> {
  _$TranslateBookResponseCopyWithImpl(this._self, this._then);

  final TranslateBookResponse _self;
  final $Res Function(TranslateBookResponse) _then;

/// Create a copy of TranslateBookResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = freezed,Object? messageAboutTranslate = freezed,}) {
  return _then(_self.copyWith(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book?,messageAboutTranslate: freezed == messageAboutTranslate ? _self.messageAboutTranslate : messageAboutTranslate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TranslateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $BookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [TranslateBookResponse].
extension TranslateBookResponsePatterns on TranslateBookResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslateBookResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslateBookResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslateBookResponse value)  $default,){
final _that = this;
switch (_that) {
case _TranslateBookResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslateBookResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TranslateBookResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Book? book,  String? messageAboutTranslate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslateBookResponse() when $default != null:
return $default(_that.book,_that.messageAboutTranslate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Book? book,  String? messageAboutTranslate)  $default,) {final _that = this;
switch (_that) {
case _TranslateBookResponse():
return $default(_that.book,_that.messageAboutTranslate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Book? book,  String? messageAboutTranslate)?  $default,) {final _that = this;
switch (_that) {
case _TranslateBookResponse() when $default != null:
return $default(_that.book,_that.messageAboutTranslate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslateBookResponse implements TranslateBookResponse {
  const _TranslateBookResponse({this.book, this.messageAboutTranslate});
  factory _TranslateBookResponse.fromJson(Map<String, dynamic> json) => _$TranslateBookResponseFromJson(json);

@override final  Book? book;
@override final  String? messageAboutTranslate;

/// Create a copy of TranslateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslateBookResponseCopyWith<_TranslateBookResponse> get copyWith => __$TranslateBookResponseCopyWithImpl<_TranslateBookResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslateBookResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslateBookResponse&&(identical(other.book, book) || other.book == book)&&(identical(other.messageAboutTranslate, messageAboutTranslate) || other.messageAboutTranslate == messageAboutTranslate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,messageAboutTranslate);

@override
String toString() {
  return 'TranslateBookResponse(book: $book, messageAboutTranslate: $messageAboutTranslate)';
}


}

/// @nodoc
abstract mixin class _$TranslateBookResponseCopyWith<$Res> implements $TranslateBookResponseCopyWith<$Res> {
  factory _$TranslateBookResponseCopyWith(_TranslateBookResponse value, $Res Function(_TranslateBookResponse) _then) = __$TranslateBookResponseCopyWithImpl;
@override @useResult
$Res call({
 Book? book, String? messageAboutTranslate
});


@override $BookCopyWith<$Res>? get book;

}
/// @nodoc
class __$TranslateBookResponseCopyWithImpl<$Res>
    implements _$TranslateBookResponseCopyWith<$Res> {
  __$TranslateBookResponseCopyWithImpl(this._self, this._then);

  final _TranslateBookResponse _self;
  final $Res Function(_TranslateBookResponse) _then;

/// Create a copy of TranslateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = freezed,Object? messageAboutTranslate = freezed,}) {
  return _then(_TranslateBookResponse(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book?,messageAboutTranslate: freezed == messageAboutTranslate ? _self.messageAboutTranslate : messageAboutTranslate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TranslateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $BookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// @nodoc
mixin _$TranslatePersonalUserBookResponse {

 PersonalUserBook? get book; String? get messageAboutTranslate;
/// Create a copy of TranslatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslatePersonalUserBookResponseCopyWith<TranslatePersonalUserBookResponse> get copyWith => _$TranslatePersonalUserBookResponseCopyWithImpl<TranslatePersonalUserBookResponse>(this as TranslatePersonalUserBookResponse, _$identity);

  /// Serializes this TranslatePersonalUserBookResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslatePersonalUserBookResponse&&(identical(other.book, book) || other.book == book)&&(identical(other.messageAboutTranslate, messageAboutTranslate) || other.messageAboutTranslate == messageAboutTranslate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,messageAboutTranslate);

@override
String toString() {
  return 'TranslatePersonalUserBookResponse(book: $book, messageAboutTranslate: $messageAboutTranslate)';
}


}

/// @nodoc
abstract mixin class $TranslatePersonalUserBookResponseCopyWith<$Res>  {
  factory $TranslatePersonalUserBookResponseCopyWith(TranslatePersonalUserBookResponse value, $Res Function(TranslatePersonalUserBookResponse) _then) = _$TranslatePersonalUserBookResponseCopyWithImpl;
@useResult
$Res call({
 PersonalUserBook? book, String? messageAboutTranslate
});


$PersonalUserBookCopyWith<$Res>? get book;

}
/// @nodoc
class _$TranslatePersonalUserBookResponseCopyWithImpl<$Res>
    implements $TranslatePersonalUserBookResponseCopyWith<$Res> {
  _$TranslatePersonalUserBookResponseCopyWithImpl(this._self, this._then);

  final TranslatePersonalUserBookResponse _self;
  final $Res Function(TranslatePersonalUserBookResponse) _then;

/// Create a copy of TranslatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = freezed,Object? messageAboutTranslate = freezed,}) {
  return _then(_self.copyWith(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as PersonalUserBook?,messageAboutTranslate: freezed == messageAboutTranslate ? _self.messageAboutTranslate : messageAboutTranslate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TranslatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $PersonalUserBookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [TranslatePersonalUserBookResponse].
extension TranslatePersonalUserBookResponsePatterns on TranslatePersonalUserBookResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslatePersonalUserBookResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslatePersonalUserBookResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslatePersonalUserBookResponse value)  $default,){
final _that = this;
switch (_that) {
case _TranslatePersonalUserBookResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslatePersonalUserBookResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TranslatePersonalUserBookResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PersonalUserBook? book,  String? messageAboutTranslate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslatePersonalUserBookResponse() when $default != null:
return $default(_that.book,_that.messageAboutTranslate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PersonalUserBook? book,  String? messageAboutTranslate)  $default,) {final _that = this;
switch (_that) {
case _TranslatePersonalUserBookResponse():
return $default(_that.book,_that.messageAboutTranslate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PersonalUserBook? book,  String? messageAboutTranslate)?  $default,) {final _that = this;
switch (_that) {
case _TranslatePersonalUserBookResponse() when $default != null:
return $default(_that.book,_that.messageAboutTranslate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslatePersonalUserBookResponse implements TranslatePersonalUserBookResponse {
  const _TranslatePersonalUserBookResponse({this.book, this.messageAboutTranslate});
  factory _TranslatePersonalUserBookResponse.fromJson(Map<String, dynamic> json) => _$TranslatePersonalUserBookResponseFromJson(json);

@override final  PersonalUserBook? book;
@override final  String? messageAboutTranslate;

/// Create a copy of TranslatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslatePersonalUserBookResponseCopyWith<_TranslatePersonalUserBookResponse> get copyWith => __$TranslatePersonalUserBookResponseCopyWithImpl<_TranslatePersonalUserBookResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslatePersonalUserBookResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslatePersonalUserBookResponse&&(identical(other.book, book) || other.book == book)&&(identical(other.messageAboutTranslate, messageAboutTranslate) || other.messageAboutTranslate == messageAboutTranslate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,messageAboutTranslate);

@override
String toString() {
  return 'TranslatePersonalUserBookResponse(book: $book, messageAboutTranslate: $messageAboutTranslate)';
}


}

/// @nodoc
abstract mixin class _$TranslatePersonalUserBookResponseCopyWith<$Res> implements $TranslatePersonalUserBookResponseCopyWith<$Res> {
  factory _$TranslatePersonalUserBookResponseCopyWith(_TranslatePersonalUserBookResponse value, $Res Function(_TranslatePersonalUserBookResponse) _then) = __$TranslatePersonalUserBookResponseCopyWithImpl;
@override @useResult
$Res call({
 PersonalUserBook? book, String? messageAboutTranslate
});


@override $PersonalUserBookCopyWith<$Res>? get book;

}
/// @nodoc
class __$TranslatePersonalUserBookResponseCopyWithImpl<$Res>
    implements _$TranslatePersonalUserBookResponseCopyWith<$Res> {
  __$TranslatePersonalUserBookResponseCopyWithImpl(this._self, this._then);

  final _TranslatePersonalUserBookResponse _self;
  final $Res Function(_TranslatePersonalUserBookResponse) _then;

/// Create a copy of TranslatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = freezed,Object? messageAboutTranslate = freezed,}) {
  return _then(_TranslatePersonalUserBookResponse(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as PersonalUserBook?,messageAboutTranslate: freezed == messageAboutTranslate ? _self.messageAboutTranslate : messageAboutTranslate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TranslatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $PersonalUserBookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// @nodoc
mixin _$UpdateBookResponse {

 Book get book;
/// Create a copy of UpdateBookResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBookResponseCopyWith<UpdateBookResponse> get copyWith => _$UpdateBookResponseCopyWithImpl<UpdateBookResponse>(this as UpdateBookResponse, _$identity);

  /// Serializes this UpdateBookResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'UpdateBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class $UpdateBookResponseCopyWith<$Res>  {
  factory $UpdateBookResponseCopyWith(UpdateBookResponse value, $Res Function(UpdateBookResponse) _then) = _$UpdateBookResponseCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$UpdateBookResponseCopyWithImpl<$Res>
    implements $UpdateBookResponseCopyWith<$Res> {
  _$UpdateBookResponseCopyWithImpl(this._self, this._then);

  final UpdateBookResponse _self;
  final $Res Function(UpdateBookResponse) _then;

/// Create a copy of UpdateBookResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,}) {
  return _then(_self.copyWith(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}
/// Create a copy of UpdateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateBookResponse].
extension UpdateBookResponsePatterns on UpdateBookResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateBookResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateBookResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateBookResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateBookResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateBookResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateBookResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Book book)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateBookResponse() when $default != null:
return $default(_that.book);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Book book)  $default,) {final _that = this;
switch (_that) {
case _UpdateBookResponse():
return $default(_that.book);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Book book)?  $default,) {final _that = this;
switch (_that) {
case _UpdateBookResponse() when $default != null:
return $default(_that.book);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateBookResponse implements UpdateBookResponse {
  const _UpdateBookResponse({required this.book});
  factory _UpdateBookResponse.fromJson(Map<String, dynamic> json) => _$UpdateBookResponseFromJson(json);

@override final  Book book;

/// Create a copy of UpdateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBookResponseCopyWith<_UpdateBookResponse> get copyWith => __$UpdateBookResponseCopyWithImpl<_UpdateBookResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBookResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'UpdateBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class _$UpdateBookResponseCopyWith<$Res> implements $UpdateBookResponseCopyWith<$Res> {
  factory _$UpdateBookResponseCopyWith(_UpdateBookResponse value, $Res Function(_UpdateBookResponse) _then) = __$UpdateBookResponseCopyWithImpl;
@override @useResult
$Res call({
 Book book
});


@override $BookCopyWith<$Res> get book;

}
/// @nodoc
class __$UpdateBookResponseCopyWithImpl<$Res>
    implements _$UpdateBookResponseCopyWith<$Res> {
  __$UpdateBookResponseCopyWithImpl(this._self, this._then);

  final _UpdateBookResponse _self;
  final $Res Function(_UpdateBookResponse) _then;

/// Create a copy of UpdateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(_UpdateBookResponse(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of UpdateBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// @nodoc
mixin _$AddFcmTokenResponse {

 bool get success;
/// Create a copy of AddFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFcmTokenResponseCopyWith<AddFcmTokenResponse> get copyWith => _$AddFcmTokenResponseCopyWithImpl<AddFcmTokenResponse>(this as AddFcmTokenResponse, _$identity);

  /// Serializes this AddFcmTokenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFcmTokenResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'AddFcmTokenResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $AddFcmTokenResponseCopyWith<$Res>  {
  factory $AddFcmTokenResponseCopyWith(AddFcmTokenResponse value, $Res Function(AddFcmTokenResponse) _then) = _$AddFcmTokenResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$AddFcmTokenResponseCopyWithImpl<$Res>
    implements $AddFcmTokenResponseCopyWith<$Res> {
  _$AddFcmTokenResponseCopyWithImpl(this._self, this._then);

  final AddFcmTokenResponse _self;
  final $Res Function(AddFcmTokenResponse) _then;

/// Create a copy of AddFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddFcmTokenResponse].
extension AddFcmTokenResponsePatterns on AddFcmTokenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddFcmTokenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddFcmTokenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddFcmTokenResponse value)  $default,){
final _that = this;
switch (_that) {
case _AddFcmTokenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddFcmTokenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AddFcmTokenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddFcmTokenResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _AddFcmTokenResponse():
return $default(_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _AddFcmTokenResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddFcmTokenResponse implements AddFcmTokenResponse {
  const _AddFcmTokenResponse({required this.success});
  factory _AddFcmTokenResponse.fromJson(Map<String, dynamic> json) => _$AddFcmTokenResponseFromJson(json);

@override final  bool success;

/// Create a copy of AddFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddFcmTokenResponseCopyWith<_AddFcmTokenResponse> get copyWith => __$AddFcmTokenResponseCopyWithImpl<_AddFcmTokenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddFcmTokenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddFcmTokenResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'AddFcmTokenResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$AddFcmTokenResponseCopyWith<$Res> implements $AddFcmTokenResponseCopyWith<$Res> {
  factory _$AddFcmTokenResponseCopyWith(_AddFcmTokenResponse value, $Res Function(_AddFcmTokenResponse) _then) = __$AddFcmTokenResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$AddFcmTokenResponseCopyWithImpl<$Res>
    implements _$AddFcmTokenResponseCopyWith<$Res> {
  __$AddFcmTokenResponseCopyWithImpl(this._self, this._then);

  final _AddFcmTokenResponse _self;
  final $Res Function(_AddFcmTokenResponse) _then;

/// Create a copy of AddFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_AddFcmTokenResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DeleteFcmTokenResponse {

 bool get success;
/// Create a copy of DeleteFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteFcmTokenResponseCopyWith<DeleteFcmTokenResponse> get copyWith => _$DeleteFcmTokenResponseCopyWithImpl<DeleteFcmTokenResponse>(this as DeleteFcmTokenResponse, _$identity);

  /// Serializes this DeleteFcmTokenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteFcmTokenResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'DeleteFcmTokenResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $DeleteFcmTokenResponseCopyWith<$Res>  {
  factory $DeleteFcmTokenResponseCopyWith(DeleteFcmTokenResponse value, $Res Function(DeleteFcmTokenResponse) _then) = _$DeleteFcmTokenResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$DeleteFcmTokenResponseCopyWithImpl<$Res>
    implements $DeleteFcmTokenResponseCopyWith<$Res> {
  _$DeleteFcmTokenResponseCopyWithImpl(this._self, this._then);

  final DeleteFcmTokenResponse _self;
  final $Res Function(DeleteFcmTokenResponse) _then;

/// Create a copy of DeleteFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteFcmTokenResponse].
extension DeleteFcmTokenResponsePatterns on DeleteFcmTokenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteFcmTokenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteFcmTokenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteFcmTokenResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeleteFcmTokenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteFcmTokenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteFcmTokenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteFcmTokenResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _DeleteFcmTokenResponse():
return $default(_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _DeleteFcmTokenResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteFcmTokenResponse implements DeleteFcmTokenResponse {
  const _DeleteFcmTokenResponse({required this.success});
  factory _DeleteFcmTokenResponse.fromJson(Map<String, dynamic> json) => _$DeleteFcmTokenResponseFromJson(json);

@override final  bool success;

/// Create a copy of DeleteFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteFcmTokenResponseCopyWith<_DeleteFcmTokenResponse> get copyWith => __$DeleteFcmTokenResponseCopyWithImpl<_DeleteFcmTokenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteFcmTokenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteFcmTokenResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'DeleteFcmTokenResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$DeleteFcmTokenResponseCopyWith<$Res> implements $DeleteFcmTokenResponseCopyWith<$Res> {
  factory _$DeleteFcmTokenResponseCopyWith(_DeleteFcmTokenResponse value, $Res Function(_DeleteFcmTokenResponse) _then) = __$DeleteFcmTokenResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$DeleteFcmTokenResponseCopyWithImpl<$Res>
    implements _$DeleteFcmTokenResponseCopyWith<$Res> {
  __$DeleteFcmTokenResponseCopyWithImpl(this._self, this._then);

  final _DeleteFcmTokenResponse _self;
  final $Res Function(_DeleteFcmTokenResponse) _then;

/// Create a copy of DeleteFcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_DeleteFcmTokenResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$LookupResponse {

 List<DictionaryWord> get words;
/// Create a copy of LookupResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookupResponseCopyWith<LookupResponse> get copyWith => _$LookupResponseCopyWithImpl<LookupResponse>(this as LookupResponse, _$identity);

  /// Serializes this LookupResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookupResponse&&const DeepCollectionEquality().equals(other.words, words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(words));

@override
String toString() {
  return 'LookupResponse(words: $words)';
}


}

/// @nodoc
abstract mixin class $LookupResponseCopyWith<$Res>  {
  factory $LookupResponseCopyWith(LookupResponse value, $Res Function(LookupResponse) _then) = _$LookupResponseCopyWithImpl;
@useResult
$Res call({
 List<DictionaryWord> words
});




}
/// @nodoc
class _$LookupResponseCopyWithImpl<$Res>
    implements $LookupResponseCopyWith<$Res> {
  _$LookupResponseCopyWithImpl(this._self, this._then);

  final LookupResponse _self;
  final $Res Function(LookupResponse) _then;

/// Create a copy of LookupResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? words = null,}) {
  return _then(_self.copyWith(
words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<DictionaryWord>,
  ));
}

}


/// Adds pattern-matching-related methods to [LookupResponse].
extension LookupResponsePatterns on LookupResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookupResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookupResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookupResponse value)  $default,){
final _that = this;
switch (_that) {
case _LookupResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookupResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LookupResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DictionaryWord> words)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookupResponse() when $default != null:
return $default(_that.words);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DictionaryWord> words)  $default,) {final _that = this;
switch (_that) {
case _LookupResponse():
return $default(_that.words);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DictionaryWord> words)?  $default,) {final _that = this;
switch (_that) {
case _LookupResponse() when $default != null:
return $default(_that.words);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LookupResponse implements LookupResponse {
  const _LookupResponse({required final  List<DictionaryWord> words}): _words = words;
  factory _LookupResponse.fromJson(Map<String, dynamic> json) => _$LookupResponseFromJson(json);

 final  List<DictionaryWord> _words;
@override List<DictionaryWord> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}


/// Create a copy of LookupResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookupResponseCopyWith<_LookupResponse> get copyWith => __$LookupResponseCopyWithImpl<_LookupResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookupResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookupResponse&&const DeepCollectionEquality().equals(other._words, _words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_words));

@override
String toString() {
  return 'LookupResponse(words: $words)';
}


}

/// @nodoc
abstract mixin class _$LookupResponseCopyWith<$Res> implements $LookupResponseCopyWith<$Res> {
  factory _$LookupResponseCopyWith(_LookupResponse value, $Res Function(_LookupResponse) _then) = __$LookupResponseCopyWithImpl;
@override @useResult
$Res call({
 List<DictionaryWord> words
});




}
/// @nodoc
class __$LookupResponseCopyWithImpl<$Res>
    implements _$LookupResponseCopyWith<$Res> {
  __$LookupResponseCopyWithImpl(this._self, this._then);

  final _LookupResponse _self;
  final $Res Function(_LookupResponse) _then;

/// Create a copy of LookupResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? words = null,}) {
  return _then(_LookupResponse(
words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<DictionaryWord>,
  ));
}


}


/// @nodoc
mixin _$GetGenresResponse {

 List<Genre> get genres;
/// Create a copy of GetGenresResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetGenresResponseCopyWith<GetGenresResponse> get copyWith => _$GetGenresResponseCopyWithImpl<GetGenresResponse>(this as GetGenresResponse, _$identity);

  /// Serializes this GetGenresResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetGenresResponse&&const DeepCollectionEquality().equals(other.genres, genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'GetGenresResponse(genres: $genres)';
}


}

/// @nodoc
abstract mixin class $GetGenresResponseCopyWith<$Res>  {
  factory $GetGenresResponseCopyWith(GetGenresResponse value, $Res Function(GetGenresResponse) _then) = _$GetGenresResponseCopyWithImpl;
@useResult
$Res call({
 List<Genre> genres
});




}
/// @nodoc
class _$GetGenresResponseCopyWithImpl<$Res>
    implements $GetGenresResponseCopyWith<$Res> {
  _$GetGenresResponseCopyWithImpl(this._self, this._then);

  final GetGenresResponse _self;
  final $Res Function(GetGenresResponse) _then;

/// Create a copy of GetGenresResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genres = null,}) {
  return _then(_self.copyWith(
genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetGenresResponse].
extension GetGenresResponsePatterns on GetGenresResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetGenresResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetGenresResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetGenresResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetGenresResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetGenresResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetGenresResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Genre> genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetGenresResponse() when $default != null:
return $default(_that.genres);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Genre> genres)  $default,) {final _that = this;
switch (_that) {
case _GetGenresResponse():
return $default(_that.genres);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Genre> genres)?  $default,) {final _that = this;
switch (_that) {
case _GetGenresResponse() when $default != null:
return $default(_that.genres);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetGenresResponse implements GetGenresResponse {
  const _GetGenresResponse({required final  List<Genre> genres}): _genres = genres;
  factory _GetGenresResponse.fromJson(Map<String, dynamic> json) => _$GetGenresResponseFromJson(json);

 final  List<Genre> _genres;
@override List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}


/// Create a copy of GetGenresResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetGenresResponseCopyWith<_GetGenresResponse> get copyWith => __$GetGenresResponseCopyWithImpl<_GetGenresResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetGenresResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetGenresResponse&&const DeepCollectionEquality().equals(other._genres, _genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'GetGenresResponse(genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$GetGenresResponseCopyWith<$Res> implements $GetGenresResponseCopyWith<$Res> {
  factory _$GetGenresResponseCopyWith(_GetGenresResponse value, $Res Function(_GetGenresResponse) _then) = __$GetGenresResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Genre> genres
});




}
/// @nodoc
class __$GetGenresResponseCopyWithImpl<$Res>
    implements _$GetGenresResponseCopyWith<$Res> {
  __$GetGenresResponseCopyWithImpl(this._self, this._then);

  final _GetGenresResponse _self;
  final $Res Function(_GetGenresResponse) _then;

/// Create a copy of GetGenresResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genres = null,}) {
  return _then(_GetGenresResponse(
genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,
  ));
}


}


/// @nodoc
mixin _$GetGenreResponse {

 Genre get genre;
/// Create a copy of GetGenreResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetGenreResponseCopyWith<GetGenreResponse> get copyWith => _$GetGenreResponseCopyWithImpl<GetGenreResponse>(this as GetGenreResponse, _$identity);

  /// Serializes this GetGenreResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetGenreResponse&&(identical(other.genre, genre) || other.genre == genre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genre);

@override
String toString() {
  return 'GetGenreResponse(genre: $genre)';
}


}

/// @nodoc
abstract mixin class $GetGenreResponseCopyWith<$Res>  {
  factory $GetGenreResponseCopyWith(GetGenreResponse value, $Res Function(GetGenreResponse) _then) = _$GetGenreResponseCopyWithImpl;
@useResult
$Res call({
 Genre genre
});


$GenreCopyWith<$Res> get genre;

}
/// @nodoc
class _$GetGenreResponseCopyWithImpl<$Res>
    implements $GetGenreResponseCopyWith<$Res> {
  _$GetGenreResponseCopyWithImpl(this._self, this._then);

  final GetGenreResponse _self;
  final $Res Function(GetGenreResponse) _then;

/// Create a copy of GetGenreResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genre = null,}) {
  return _then(_self.copyWith(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,
  ));
}
/// Create a copy of GetGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetGenreResponse].
extension GetGenreResponsePatterns on GetGenreResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetGenreResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetGenreResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetGenreResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetGenreResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetGenreResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetGenreResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Genre genre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetGenreResponse() when $default != null:
return $default(_that.genre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Genre genre)  $default,) {final _that = this;
switch (_that) {
case _GetGenreResponse():
return $default(_that.genre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Genre genre)?  $default,) {final _that = this;
switch (_that) {
case _GetGenreResponse() when $default != null:
return $default(_that.genre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetGenreResponse implements GetGenreResponse {
  const _GetGenreResponse({required this.genre});
  factory _GetGenreResponse.fromJson(Map<String, dynamic> json) => _$GetGenreResponseFromJson(json);

@override final  Genre genre;

/// Create a copy of GetGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetGenreResponseCopyWith<_GetGenreResponse> get copyWith => __$GetGenreResponseCopyWithImpl<_GetGenreResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetGenreResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetGenreResponse&&(identical(other.genre, genre) || other.genre == genre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genre);

@override
String toString() {
  return 'GetGenreResponse(genre: $genre)';
}


}

/// @nodoc
abstract mixin class _$GetGenreResponseCopyWith<$Res> implements $GetGenreResponseCopyWith<$Res> {
  factory _$GetGenreResponseCopyWith(_GetGenreResponse value, $Res Function(_GetGenreResponse) _then) = __$GetGenreResponseCopyWithImpl;
@override @useResult
$Res call({
 Genre genre
});


@override $GenreCopyWith<$Res> get genre;

}
/// @nodoc
class __$GetGenreResponseCopyWithImpl<$Res>
    implements _$GetGenreResponseCopyWith<$Res> {
  __$GetGenreResponseCopyWithImpl(this._self, this._then);

  final _GetGenreResponse _self;
  final $Res Function(_GetGenreResponse) _then;

/// Create a copy of GetGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genre = null,}) {
  return _then(_GetGenreResponse(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,
  ));
}

/// Create a copy of GetGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// @nodoc
mixin _$CreateGenreResponse {

 Genre get genre;
/// Create a copy of CreateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateGenreResponseCopyWith<CreateGenreResponse> get copyWith => _$CreateGenreResponseCopyWithImpl<CreateGenreResponse>(this as CreateGenreResponse, _$identity);

  /// Serializes this CreateGenreResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateGenreResponse&&(identical(other.genre, genre) || other.genre == genre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genre);

@override
String toString() {
  return 'CreateGenreResponse(genre: $genre)';
}


}

/// @nodoc
abstract mixin class $CreateGenreResponseCopyWith<$Res>  {
  factory $CreateGenreResponseCopyWith(CreateGenreResponse value, $Res Function(CreateGenreResponse) _then) = _$CreateGenreResponseCopyWithImpl;
@useResult
$Res call({
 Genre genre
});


$GenreCopyWith<$Res> get genre;

}
/// @nodoc
class _$CreateGenreResponseCopyWithImpl<$Res>
    implements $CreateGenreResponseCopyWith<$Res> {
  _$CreateGenreResponseCopyWithImpl(this._self, this._then);

  final CreateGenreResponse _self;
  final $Res Function(CreateGenreResponse) _then;

/// Create a copy of CreateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genre = null,}) {
  return _then(_self.copyWith(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,
  ));
}
/// Create a copy of CreateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateGenreResponse].
extension CreateGenreResponsePatterns on CreateGenreResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateGenreResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateGenreResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateGenreResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateGenreResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateGenreResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateGenreResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Genre genre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateGenreResponse() when $default != null:
return $default(_that.genre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Genre genre)  $default,) {final _that = this;
switch (_that) {
case _CreateGenreResponse():
return $default(_that.genre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Genre genre)?  $default,) {final _that = this;
switch (_that) {
case _CreateGenreResponse() when $default != null:
return $default(_that.genre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateGenreResponse implements CreateGenreResponse {
  const _CreateGenreResponse({required this.genre});
  factory _CreateGenreResponse.fromJson(Map<String, dynamic> json) => _$CreateGenreResponseFromJson(json);

@override final  Genre genre;

/// Create a copy of CreateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateGenreResponseCopyWith<_CreateGenreResponse> get copyWith => __$CreateGenreResponseCopyWithImpl<_CreateGenreResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateGenreResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateGenreResponse&&(identical(other.genre, genre) || other.genre == genre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genre);

@override
String toString() {
  return 'CreateGenreResponse(genre: $genre)';
}


}

/// @nodoc
abstract mixin class _$CreateGenreResponseCopyWith<$Res> implements $CreateGenreResponseCopyWith<$Res> {
  factory _$CreateGenreResponseCopyWith(_CreateGenreResponse value, $Res Function(_CreateGenreResponse) _then) = __$CreateGenreResponseCopyWithImpl;
@override @useResult
$Res call({
 Genre genre
});


@override $GenreCopyWith<$Res> get genre;

}
/// @nodoc
class __$CreateGenreResponseCopyWithImpl<$Res>
    implements _$CreateGenreResponseCopyWith<$Res> {
  __$CreateGenreResponseCopyWithImpl(this._self, this._then);

  final _CreateGenreResponse _self;
  final $Res Function(_CreateGenreResponse) _then;

/// Create a copy of CreateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genre = null,}) {
  return _then(_CreateGenreResponse(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,
  ));
}

/// Create a copy of CreateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// @nodoc
mixin _$UpdateGenreResponse {

 Genre get genre;
/// Create a copy of UpdateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateGenreResponseCopyWith<UpdateGenreResponse> get copyWith => _$UpdateGenreResponseCopyWithImpl<UpdateGenreResponse>(this as UpdateGenreResponse, _$identity);

  /// Serializes this UpdateGenreResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateGenreResponse&&(identical(other.genre, genre) || other.genre == genre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genre);

@override
String toString() {
  return 'UpdateGenreResponse(genre: $genre)';
}


}

/// @nodoc
abstract mixin class $UpdateGenreResponseCopyWith<$Res>  {
  factory $UpdateGenreResponseCopyWith(UpdateGenreResponse value, $Res Function(UpdateGenreResponse) _then) = _$UpdateGenreResponseCopyWithImpl;
@useResult
$Res call({
 Genre genre
});


$GenreCopyWith<$Res> get genre;

}
/// @nodoc
class _$UpdateGenreResponseCopyWithImpl<$Res>
    implements $UpdateGenreResponseCopyWith<$Res> {
  _$UpdateGenreResponseCopyWithImpl(this._self, this._then);

  final UpdateGenreResponse _self;
  final $Res Function(UpdateGenreResponse) _then;

/// Create a copy of UpdateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genre = null,}) {
  return _then(_self.copyWith(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,
  ));
}
/// Create a copy of UpdateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateGenreResponse].
extension UpdateGenreResponsePatterns on UpdateGenreResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateGenreResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateGenreResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateGenreResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateGenreResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateGenreResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateGenreResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Genre genre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateGenreResponse() when $default != null:
return $default(_that.genre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Genre genre)  $default,) {final _that = this;
switch (_that) {
case _UpdateGenreResponse():
return $default(_that.genre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Genre genre)?  $default,) {final _that = this;
switch (_that) {
case _UpdateGenreResponse() when $default != null:
return $default(_that.genre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateGenreResponse implements UpdateGenreResponse {
  const _UpdateGenreResponse({required this.genre});
  factory _UpdateGenreResponse.fromJson(Map<String, dynamic> json) => _$UpdateGenreResponseFromJson(json);

@override final  Genre genre;

/// Create a copy of UpdateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGenreResponseCopyWith<_UpdateGenreResponse> get copyWith => __$UpdateGenreResponseCopyWithImpl<_UpdateGenreResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateGenreResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGenreResponse&&(identical(other.genre, genre) || other.genre == genre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genre);

@override
String toString() {
  return 'UpdateGenreResponse(genre: $genre)';
}


}

/// @nodoc
abstract mixin class _$UpdateGenreResponseCopyWith<$Res> implements $UpdateGenreResponseCopyWith<$Res> {
  factory _$UpdateGenreResponseCopyWith(_UpdateGenreResponse value, $Res Function(_UpdateGenreResponse) _then) = __$UpdateGenreResponseCopyWithImpl;
@override @useResult
$Res call({
 Genre genre
});


@override $GenreCopyWith<$Res> get genre;

}
/// @nodoc
class __$UpdateGenreResponseCopyWithImpl<$Res>
    implements _$UpdateGenreResponseCopyWith<$Res> {
  __$UpdateGenreResponseCopyWithImpl(this._self, this._then);

  final _UpdateGenreResponse _self;
  final $Res Function(_UpdateGenreResponse) _then;

/// Create a copy of UpdateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genre = null,}) {
  return _then(_UpdateGenreResponse(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,
  ));
}

/// Create a copy of UpdateGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// @nodoc
mixin _$DeleteGenreResponse {

 bool get success;
/// Create a copy of DeleteGenreResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteGenreResponseCopyWith<DeleteGenreResponse> get copyWith => _$DeleteGenreResponseCopyWithImpl<DeleteGenreResponse>(this as DeleteGenreResponse, _$identity);

  /// Serializes this DeleteGenreResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteGenreResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'DeleteGenreResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $DeleteGenreResponseCopyWith<$Res>  {
  factory $DeleteGenreResponseCopyWith(DeleteGenreResponse value, $Res Function(DeleteGenreResponse) _then) = _$DeleteGenreResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$DeleteGenreResponseCopyWithImpl<$Res>
    implements $DeleteGenreResponseCopyWith<$Res> {
  _$DeleteGenreResponseCopyWithImpl(this._self, this._then);

  final DeleteGenreResponse _self;
  final $Res Function(DeleteGenreResponse) _then;

/// Create a copy of DeleteGenreResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteGenreResponse].
extension DeleteGenreResponsePatterns on DeleteGenreResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteGenreResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteGenreResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteGenreResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeleteGenreResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteGenreResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteGenreResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteGenreResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _DeleteGenreResponse():
return $default(_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _DeleteGenreResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteGenreResponse implements DeleteGenreResponse {
  const _DeleteGenreResponse({required this.success});
  factory _DeleteGenreResponse.fromJson(Map<String, dynamic> json) => _$DeleteGenreResponseFromJson(json);

@override final  bool success;

/// Create a copy of DeleteGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteGenreResponseCopyWith<_DeleteGenreResponse> get copyWith => __$DeleteGenreResponseCopyWithImpl<_DeleteGenreResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteGenreResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteGenreResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'DeleteGenreResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$DeleteGenreResponseCopyWith<$Res> implements $DeleteGenreResponseCopyWith<$Res> {
  factory _$DeleteGenreResponseCopyWith(_DeleteGenreResponse value, $Res Function(_DeleteGenreResponse) _then) = __$DeleteGenreResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$DeleteGenreResponseCopyWithImpl<$Res>
    implements _$DeleteGenreResponseCopyWith<$Res> {
  __$DeleteGenreResponseCopyWithImpl(this._self, this._then);

  final _DeleteGenreResponse _self;
  final $Res Function(_DeleteGenreResponse) _then;

/// Create a copy of DeleteGenreResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_DeleteGenreResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$GetPersonalUserBooksResponse {

 List<PersonalUserBook> get books;
/// Create a copy of GetPersonalUserBooksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPersonalUserBooksResponseCopyWith<GetPersonalUserBooksResponse> get copyWith => _$GetPersonalUserBooksResponseCopyWithImpl<GetPersonalUserBooksResponse>(this as GetPersonalUserBooksResponse, _$identity);

  /// Serializes this GetPersonalUserBooksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPersonalUserBooksResponse&&const DeepCollectionEquality().equals(other.books, books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(books));

@override
String toString() {
  return 'GetPersonalUserBooksResponse(books: $books)';
}


}

/// @nodoc
abstract mixin class $GetPersonalUserBooksResponseCopyWith<$Res>  {
  factory $GetPersonalUserBooksResponseCopyWith(GetPersonalUserBooksResponse value, $Res Function(GetPersonalUserBooksResponse) _then) = _$GetPersonalUserBooksResponseCopyWithImpl;
@useResult
$Res call({
 List<PersonalUserBook> books
});




}
/// @nodoc
class _$GetPersonalUserBooksResponseCopyWithImpl<$Res>
    implements $GetPersonalUserBooksResponseCopyWith<$Res> {
  _$GetPersonalUserBooksResponseCopyWithImpl(this._self, this._then);

  final GetPersonalUserBooksResponse _self;
  final $Res Function(GetPersonalUserBooksResponse) _then;

/// Create a copy of GetPersonalUserBooksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? books = null,}) {
  return _then(_self.copyWith(
books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<PersonalUserBook>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPersonalUserBooksResponse].
extension GetPersonalUserBooksResponsePatterns on GetPersonalUserBooksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPersonalUserBooksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPersonalUserBooksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPersonalUserBooksResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetPersonalUserBooksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPersonalUserBooksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetPersonalUserBooksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PersonalUserBook> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPersonalUserBooksResponse() when $default != null:
return $default(_that.books);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PersonalUserBook> books)  $default,) {final _that = this;
switch (_that) {
case _GetPersonalUserBooksResponse():
return $default(_that.books);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PersonalUserBook> books)?  $default,) {final _that = this;
switch (_that) {
case _GetPersonalUserBooksResponse() when $default != null:
return $default(_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPersonalUserBooksResponse implements GetPersonalUserBooksResponse {
  const _GetPersonalUserBooksResponse({required final  List<PersonalUserBook> books}): _books = books;
  factory _GetPersonalUserBooksResponse.fromJson(Map<String, dynamic> json) => _$GetPersonalUserBooksResponseFromJson(json);

 final  List<PersonalUserBook> _books;
@override List<PersonalUserBook> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of GetPersonalUserBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPersonalUserBooksResponseCopyWith<_GetPersonalUserBooksResponse> get copyWith => __$GetPersonalUserBooksResponseCopyWithImpl<_GetPersonalUserBooksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPersonalUserBooksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPersonalUserBooksResponse&&const DeepCollectionEquality().equals(other._books, _books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'GetPersonalUserBooksResponse(books: $books)';
}


}

/// @nodoc
abstract mixin class _$GetPersonalUserBooksResponseCopyWith<$Res> implements $GetPersonalUserBooksResponseCopyWith<$Res> {
  factory _$GetPersonalUserBooksResponseCopyWith(_GetPersonalUserBooksResponse value, $Res Function(_GetPersonalUserBooksResponse) _then) = __$GetPersonalUserBooksResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PersonalUserBook> books
});




}
/// @nodoc
class __$GetPersonalUserBooksResponseCopyWithImpl<$Res>
    implements _$GetPersonalUserBooksResponseCopyWith<$Res> {
  __$GetPersonalUserBooksResponseCopyWithImpl(this._self, this._then);

  final _GetPersonalUserBooksResponse _self;
  final $Res Function(_GetPersonalUserBooksResponse) _then;

/// Create a copy of GetPersonalUserBooksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? books = null,}) {
  return _then(_GetPersonalUserBooksResponse(
books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<PersonalUserBook>,
  ));
}


}


/// @nodoc
mixin _$GetPersonalUserBookResponse {

 PersonalUserBook get book;
/// Create a copy of GetPersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPersonalUserBookResponseCopyWith<GetPersonalUserBookResponse> get copyWith => _$GetPersonalUserBookResponseCopyWithImpl<GetPersonalUserBookResponse>(this as GetPersonalUserBookResponse, _$identity);

  /// Serializes this GetPersonalUserBookResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPersonalUserBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'GetPersonalUserBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class $GetPersonalUserBookResponseCopyWith<$Res>  {
  factory $GetPersonalUserBookResponseCopyWith(GetPersonalUserBookResponse value, $Res Function(GetPersonalUserBookResponse) _then) = _$GetPersonalUserBookResponseCopyWithImpl;
@useResult
$Res call({
 PersonalUserBook book
});


$PersonalUserBookCopyWith<$Res> get book;

}
/// @nodoc
class _$GetPersonalUserBookResponseCopyWithImpl<$Res>
    implements $GetPersonalUserBookResponseCopyWith<$Res> {
  _$GetPersonalUserBookResponseCopyWithImpl(this._self, this._then);

  final GetPersonalUserBookResponse _self;
  final $Res Function(GetPersonalUserBookResponse) _then;

/// Create a copy of GetPersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,}) {
  return _then(_self.copyWith(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as PersonalUserBook,
  ));
}
/// Create a copy of GetPersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<$Res> get book {
  
  return $PersonalUserBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetPersonalUserBookResponse].
extension GetPersonalUserBookResponsePatterns on GetPersonalUserBookResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPersonalUserBookResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPersonalUserBookResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPersonalUserBookResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetPersonalUserBookResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPersonalUserBookResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetPersonalUserBookResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PersonalUserBook book)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPersonalUserBookResponse() when $default != null:
return $default(_that.book);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PersonalUserBook book)  $default,) {final _that = this;
switch (_that) {
case _GetPersonalUserBookResponse():
return $default(_that.book);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PersonalUserBook book)?  $default,) {final _that = this;
switch (_that) {
case _GetPersonalUserBookResponse() when $default != null:
return $default(_that.book);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPersonalUserBookResponse implements GetPersonalUserBookResponse {
  const _GetPersonalUserBookResponse({required this.book});
  factory _GetPersonalUserBookResponse.fromJson(Map<String, dynamic> json) => _$GetPersonalUserBookResponseFromJson(json);

@override final  PersonalUserBook book;

/// Create a copy of GetPersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPersonalUserBookResponseCopyWith<_GetPersonalUserBookResponse> get copyWith => __$GetPersonalUserBookResponseCopyWithImpl<_GetPersonalUserBookResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPersonalUserBookResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPersonalUserBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'GetPersonalUserBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class _$GetPersonalUserBookResponseCopyWith<$Res> implements $GetPersonalUserBookResponseCopyWith<$Res> {
  factory _$GetPersonalUserBookResponseCopyWith(_GetPersonalUserBookResponse value, $Res Function(_GetPersonalUserBookResponse) _then) = __$GetPersonalUserBookResponseCopyWithImpl;
@override @useResult
$Res call({
 PersonalUserBook book
});


@override $PersonalUserBookCopyWith<$Res> get book;

}
/// @nodoc
class __$GetPersonalUserBookResponseCopyWithImpl<$Res>
    implements _$GetPersonalUserBookResponseCopyWith<$Res> {
  __$GetPersonalUserBookResponseCopyWithImpl(this._self, this._then);

  final _GetPersonalUserBookResponse _self;
  final $Res Function(_GetPersonalUserBookResponse) _then;

/// Create a copy of GetPersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(_GetPersonalUserBookResponse(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as PersonalUserBook,
  ));
}

/// Create a copy of GetPersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<$Res> get book {
  
  return $PersonalUserBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// @nodoc
mixin _$UpdatePersonalUserBookResponse {

 PersonalUserBook get book;
/// Create a copy of UpdatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePersonalUserBookResponseCopyWith<UpdatePersonalUserBookResponse> get copyWith => _$UpdatePersonalUserBookResponseCopyWithImpl<UpdatePersonalUserBookResponse>(this as UpdatePersonalUserBookResponse, _$identity);

  /// Serializes this UpdatePersonalUserBookResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePersonalUserBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'UpdatePersonalUserBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class $UpdatePersonalUserBookResponseCopyWith<$Res>  {
  factory $UpdatePersonalUserBookResponseCopyWith(UpdatePersonalUserBookResponse value, $Res Function(UpdatePersonalUserBookResponse) _then) = _$UpdatePersonalUserBookResponseCopyWithImpl;
@useResult
$Res call({
 PersonalUserBook book
});


$PersonalUserBookCopyWith<$Res> get book;

}
/// @nodoc
class _$UpdatePersonalUserBookResponseCopyWithImpl<$Res>
    implements $UpdatePersonalUserBookResponseCopyWith<$Res> {
  _$UpdatePersonalUserBookResponseCopyWithImpl(this._self, this._then);

  final UpdatePersonalUserBookResponse _self;
  final $Res Function(UpdatePersonalUserBookResponse) _then;

/// Create a copy of UpdatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,}) {
  return _then(_self.copyWith(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as PersonalUserBook,
  ));
}
/// Create a copy of UpdatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<$Res> get book {
  
  return $PersonalUserBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdatePersonalUserBookResponse].
extension UpdatePersonalUserBookResponsePatterns on UpdatePersonalUserBookResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePersonalUserBookResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePersonalUserBookResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePersonalUserBookResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePersonalUserBookResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePersonalUserBookResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePersonalUserBookResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PersonalUserBook book)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePersonalUserBookResponse() when $default != null:
return $default(_that.book);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PersonalUserBook book)  $default,) {final _that = this;
switch (_that) {
case _UpdatePersonalUserBookResponse():
return $default(_that.book);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PersonalUserBook book)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePersonalUserBookResponse() when $default != null:
return $default(_that.book);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatePersonalUserBookResponse implements UpdatePersonalUserBookResponse {
  const _UpdatePersonalUserBookResponse({required this.book});
  factory _UpdatePersonalUserBookResponse.fromJson(Map<String, dynamic> json) => _$UpdatePersonalUserBookResponseFromJson(json);

@override final  PersonalUserBook book;

/// Create a copy of UpdatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePersonalUserBookResponseCopyWith<_UpdatePersonalUserBookResponse> get copyWith => __$UpdatePersonalUserBookResponseCopyWithImpl<_UpdatePersonalUserBookResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePersonalUserBookResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePersonalUserBookResponse&&(identical(other.book, book) || other.book == book));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'UpdatePersonalUserBookResponse(book: $book)';
}


}

/// @nodoc
abstract mixin class _$UpdatePersonalUserBookResponseCopyWith<$Res> implements $UpdatePersonalUserBookResponseCopyWith<$Res> {
  factory _$UpdatePersonalUserBookResponseCopyWith(_UpdatePersonalUserBookResponse value, $Res Function(_UpdatePersonalUserBookResponse) _then) = __$UpdatePersonalUserBookResponseCopyWithImpl;
@override @useResult
$Res call({
 PersonalUserBook book
});


@override $PersonalUserBookCopyWith<$Res> get book;

}
/// @nodoc
class __$UpdatePersonalUserBookResponseCopyWithImpl<$Res>
    implements _$UpdatePersonalUserBookResponseCopyWith<$Res> {
  __$UpdatePersonalUserBookResponseCopyWithImpl(this._self, this._then);

  final _UpdatePersonalUserBookResponse _self;
  final $Res Function(_UpdatePersonalUserBookResponse) _then;

/// Create a copy of UpdatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(_UpdatePersonalUserBookResponse(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as PersonalUserBook,
  ));
}

/// Create a copy of UpdatePersonalUserBookResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<$Res> get book {
  
  return $PersonalUserBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// @nodoc
mixin _$UpdateMetadataResponse {

 User get user;
/// Create a copy of UpdateMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMetadataResponseCopyWith<UpdateMetadataResponse> get copyWith => _$UpdateMetadataResponseCopyWithImpl<UpdateMetadataResponse>(this as UpdateMetadataResponse, _$identity);

  /// Serializes this UpdateMetadataResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMetadataResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UpdateMetadataResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class $UpdateMetadataResponseCopyWith<$Res>  {
  factory $UpdateMetadataResponseCopyWith(UpdateMetadataResponse value, $Res Function(UpdateMetadataResponse) _then) = _$UpdateMetadataResponseCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UpdateMetadataResponseCopyWithImpl<$Res>
    implements $UpdateMetadataResponseCopyWith<$Res> {
  _$UpdateMetadataResponseCopyWithImpl(this._self, this._then);

  final UpdateMetadataResponse _self;
  final $Res Function(UpdateMetadataResponse) _then;

/// Create a copy of UpdateMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of UpdateMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateMetadataResponse].
extension UpdateMetadataResponsePatterns on UpdateMetadataResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateMetadataResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateMetadataResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateMetadataResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateMetadataResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateMetadataResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateMetadataResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateMetadataResponse() when $default != null:
return $default(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User user)  $default,) {final _that = this;
switch (_that) {
case _UpdateMetadataResponse():
return $default(_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User user)?  $default,) {final _that = this;
switch (_that) {
case _UpdateMetadataResponse() when $default != null:
return $default(_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateMetadataResponse implements UpdateMetadataResponse {
  const _UpdateMetadataResponse({required this.user});
  factory _UpdateMetadataResponse.fromJson(Map<String, dynamic> json) => _$UpdateMetadataResponseFromJson(json);

@override final  User user;

/// Create a copy of UpdateMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMetadataResponseCopyWith<_UpdateMetadataResponse> get copyWith => __$UpdateMetadataResponseCopyWithImpl<_UpdateMetadataResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateMetadataResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMetadataResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UpdateMetadataResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UpdateMetadataResponseCopyWith<$Res> implements $UpdateMetadataResponseCopyWith<$Res> {
  factory _$UpdateMetadataResponseCopyWith(_UpdateMetadataResponse value, $Res Function(_UpdateMetadataResponse) _then) = __$UpdateMetadataResponseCopyWithImpl;
@override @useResult
$Res call({
 User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UpdateMetadataResponseCopyWithImpl<$Res>
    implements _$UpdateMetadataResponseCopyWith<$Res> {
  __$UpdateMetadataResponseCopyWithImpl(this._self, this._then);

  final _UpdateMetadataResponse _self;
  final $Res Function(_UpdateMetadataResponse) _then;

/// Create a copy of UpdateMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UpdateMetadataResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UpdateMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
