// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthStateStart value)?  start,TResult Function( _AuthStateLoading value)?  loading,TResult Function( _AuthStateAuthenticated value)?  authenticated,TResult Function( _AuthStateUnauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthStateStart() when start != null:
return start(_that);case _AuthStateLoading() when loading != null:
return loading(_that);case _AuthStateAuthenticated() when authenticated != null:
return authenticated(_that);case _AuthStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthStateStart value)  start,required TResult Function( _AuthStateLoading value)  loading,required TResult Function( _AuthStateAuthenticated value)  authenticated,required TResult Function( _AuthStateUnauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case _AuthStateStart():
return start(_that);case _AuthStateLoading():
return loading(_that);case _AuthStateAuthenticated():
return authenticated(_that);case _AuthStateUnauthenticated():
return unauthenticated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthStateStart value)?  start,TResult? Function( _AuthStateLoading value)?  loading,TResult? Function( _AuthStateAuthenticated value)?  authenticated,TResult? Function( _AuthStateUnauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case _AuthStateStart() when start != null:
return start(_that);case _AuthStateLoading() when loading != null:
return loading(_that);case _AuthStateAuthenticated() when authenticated != null:
return authenticated(_that);case _AuthStateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function()?  loading,TResult Function( User user)?  authenticated,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStateStart() when start != null:
return start();case _AuthStateLoading() when loading != null:
return loading();case _AuthStateAuthenticated() when authenticated != null:
return authenticated(_that.user);case _AuthStateUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function()  loading,required TResult Function( User user)  authenticated,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case _AuthStateStart():
return start();case _AuthStateLoading():
return loading();case _AuthStateAuthenticated():
return authenticated(_that.user);case _AuthStateUnauthenticated():
return unauthenticated();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function()?  loading,TResult? Function( User user)?  authenticated,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case _AuthStateStart() when start != null:
return start();case _AuthStateLoading() when loading != null:
return loading();case _AuthStateAuthenticated() when authenticated != null:
return authenticated(_that.user);case _AuthStateUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _AuthStateStart with DiagnosticableTreeMixin implements AuthState {
  const _AuthStateStart();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.start'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStateStart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.start()';
}


}




/// @nodoc


class _AuthStateLoading with DiagnosticableTreeMixin implements AuthState {
  const _AuthStateLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _AuthStateAuthenticated with DiagnosticableTreeMixin implements AuthState {
  const _AuthStateAuthenticated({required this.user});
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateAuthenticatedCopyWith<_AuthStateAuthenticated> get copyWith => __$AuthStateAuthenticatedCopyWithImpl<_AuthStateAuthenticated>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.authenticated'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStateAuthenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthStateAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateAuthenticatedCopyWith(_AuthStateAuthenticated value, $Res Function(_AuthStateAuthenticated) _then) = __$AuthStateAuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthStateAuthenticatedCopyWithImpl<$Res>
    implements _$AuthStateAuthenticatedCopyWith<$Res> {
  __$AuthStateAuthenticatedCopyWithImpl(this._self, this._then);

  final _AuthStateAuthenticated _self;
  final $Res Function(_AuthStateAuthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_AuthStateAuthenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
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


class _AuthStateUnauthenticated with DiagnosticableTreeMixin implements AuthState {
  const _AuthStateUnauthenticated();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.unauthenticated'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStateUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.unauthenticated()';
}


}




// dart format on
