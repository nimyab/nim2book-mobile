// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BooksState {

 List<Book> get allBooks; List<Book> get savedBooks; List<PersonalUserBook> get personalBooks; bool get isFetching;
/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooksStateCopyWith<BooksState> get copyWith => _$BooksStateCopyWithImpl<BooksState>(this as BooksState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooksState&&const DeepCollectionEquality().equals(other.allBooks, allBooks)&&const DeepCollectionEquality().equals(other.savedBooks, savedBooks)&&const DeepCollectionEquality().equals(other.personalBooks, personalBooks)&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allBooks),const DeepCollectionEquality().hash(savedBooks),const DeepCollectionEquality().hash(personalBooks),isFetching);

@override
String toString() {
  return 'BooksState(allBooks: $allBooks, savedBooks: $savedBooks, personalBooks: $personalBooks, isFetching: $isFetching)';
}


}

/// @nodoc
abstract mixin class $BooksStateCopyWith<$Res>  {
  factory $BooksStateCopyWith(BooksState value, $Res Function(BooksState) _then) = _$BooksStateCopyWithImpl;
@useResult
$Res call({
 List<Book> allBooks, List<Book> savedBooks, List<PersonalUserBook> personalBooks, bool isFetching
});




}
/// @nodoc
class _$BooksStateCopyWithImpl<$Res>
    implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._self, this._then);

  final BooksState _self;
  final $Res Function(BooksState) _then;

/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allBooks = null,Object? savedBooks = null,Object? personalBooks = null,Object? isFetching = null,}) {
  return _then(_self.copyWith(
allBooks: null == allBooks ? _self.allBooks : allBooks // ignore: cast_nullable_to_non_nullable
as List<Book>,savedBooks: null == savedBooks ? _self.savedBooks : savedBooks // ignore: cast_nullable_to_non_nullable
as List<Book>,personalBooks: null == personalBooks ? _self.personalBooks : personalBooks // ignore: cast_nullable_to_non_nullable
as List<PersonalUserBook>,isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BooksState].
extension BooksStatePatterns on BooksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BooksState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BooksState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BooksState value)  $default,){
final _that = this;
switch (_that) {
case _BooksState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BooksState value)?  $default,){
final _that = this;
switch (_that) {
case _BooksState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Book> allBooks,  List<Book> savedBooks,  List<PersonalUserBook> personalBooks,  bool isFetching)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BooksState() when $default != null:
return $default(_that.allBooks,_that.savedBooks,_that.personalBooks,_that.isFetching);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Book> allBooks,  List<Book> savedBooks,  List<PersonalUserBook> personalBooks,  bool isFetching)  $default,) {final _that = this;
switch (_that) {
case _BooksState():
return $default(_that.allBooks,_that.savedBooks,_that.personalBooks,_that.isFetching);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Book> allBooks,  List<Book> savedBooks,  List<PersonalUserBook> personalBooks,  bool isFetching)?  $default,) {final _that = this;
switch (_that) {
case _BooksState() when $default != null:
return $default(_that.allBooks,_that.savedBooks,_that.personalBooks,_that.isFetching);case _:
  return null;

}
}

}

/// @nodoc


class _BooksState implements BooksState {
  const _BooksState({final  List<Book> allBooks = const [], final  List<Book> savedBooks = const [], final  List<PersonalUserBook> personalBooks = const [], this.isFetching = false}): _allBooks = allBooks,_savedBooks = savedBooks,_personalBooks = personalBooks;
  

 final  List<Book> _allBooks;
@override@JsonKey() List<Book> get allBooks {
  if (_allBooks is EqualUnmodifiableListView) return _allBooks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allBooks);
}

 final  List<Book> _savedBooks;
@override@JsonKey() List<Book> get savedBooks {
  if (_savedBooks is EqualUnmodifiableListView) return _savedBooks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedBooks);
}

 final  List<PersonalUserBook> _personalBooks;
@override@JsonKey() List<PersonalUserBook> get personalBooks {
  if (_personalBooks is EqualUnmodifiableListView) return _personalBooks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personalBooks);
}

@override@JsonKey() final  bool isFetching;

/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BooksStateCopyWith<_BooksState> get copyWith => __$BooksStateCopyWithImpl<_BooksState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BooksState&&const DeepCollectionEquality().equals(other._allBooks, _allBooks)&&const DeepCollectionEquality().equals(other._savedBooks, _savedBooks)&&const DeepCollectionEquality().equals(other._personalBooks, _personalBooks)&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allBooks),const DeepCollectionEquality().hash(_savedBooks),const DeepCollectionEquality().hash(_personalBooks),isFetching);

@override
String toString() {
  return 'BooksState(allBooks: $allBooks, savedBooks: $savedBooks, personalBooks: $personalBooks, isFetching: $isFetching)';
}


}

/// @nodoc
abstract mixin class _$BooksStateCopyWith<$Res> implements $BooksStateCopyWith<$Res> {
  factory _$BooksStateCopyWith(_BooksState value, $Res Function(_BooksState) _then) = __$BooksStateCopyWithImpl;
@override @useResult
$Res call({
 List<Book> allBooks, List<Book> savedBooks, List<PersonalUserBook> personalBooks, bool isFetching
});




}
/// @nodoc
class __$BooksStateCopyWithImpl<$Res>
    implements _$BooksStateCopyWith<$Res> {
  __$BooksStateCopyWithImpl(this._self, this._then);

  final _BooksState _self;
  final $Res Function(_BooksState) _then;

/// Create a copy of BooksState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allBooks = null,Object? savedBooks = null,Object? personalBooks = null,Object? isFetching = null,}) {
  return _then(_BooksState(
allBooks: null == allBooks ? _self._allBooks : allBooks // ignore: cast_nullable_to_non_nullable
as List<Book>,savedBooks: null == savedBooks ? _self._savedBooks : savedBooks // ignore: cast_nullable_to_non_nullable
as List<Book>,personalBooks: null == personalBooks ? _self._personalBooks : personalBooks // ignore: cast_nullable_to_non_nullable
as List<PersonalUserBook>,isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
