// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterAlignNode {

 String get id; String get title; String get translatedTitle; int get order; List<ParagraphAlignNode> get content;
/// Create a copy of ChapterAlignNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterAlignNodeCopyWith<ChapterAlignNode> get copyWith => _$ChapterAlignNodeCopyWithImpl<ChapterAlignNode>(this as ChapterAlignNode, _$identity);

  /// Serializes this ChapterAlignNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterAlignNode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.translatedTitle, translatedTitle) || other.translatedTitle == translatedTitle)&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other.content, content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,translatedTitle,order,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'ChapterAlignNode(id: $id, title: $title, translatedTitle: $translatedTitle, order: $order, content: $content)';
}


}

/// @nodoc
abstract mixin class $ChapterAlignNodeCopyWith<$Res>  {
  factory $ChapterAlignNodeCopyWith(ChapterAlignNode value, $Res Function(ChapterAlignNode) _then) = _$ChapterAlignNodeCopyWithImpl;
@useResult
$Res call({
 String id, String title, String translatedTitle, int order, List<ParagraphAlignNode> content
});




}
/// @nodoc
class _$ChapterAlignNodeCopyWithImpl<$Res>
    implements $ChapterAlignNodeCopyWith<$Res> {
  _$ChapterAlignNodeCopyWithImpl(this._self, this._then);

  final ChapterAlignNode _self;
  final $Res Function(ChapterAlignNode) _then;

/// Create a copy of ChapterAlignNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? translatedTitle = null,Object? order = null,Object? content = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,translatedTitle: null == translatedTitle ? _self.translatedTitle : translatedTitle // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<ParagraphAlignNode>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterAlignNode].
extension ChapterAlignNodePatterns on ChapterAlignNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterAlignNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterAlignNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterAlignNode value)  $default,){
final _that = this;
switch (_that) {
case _ChapterAlignNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterAlignNode value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterAlignNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String translatedTitle,  int order,  List<ParagraphAlignNode> content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterAlignNode() when $default != null:
return $default(_that.id,_that.title,_that.translatedTitle,_that.order,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String translatedTitle,  int order,  List<ParagraphAlignNode> content)  $default,) {final _that = this;
switch (_that) {
case _ChapterAlignNode():
return $default(_that.id,_that.title,_that.translatedTitle,_that.order,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String translatedTitle,  int order,  List<ParagraphAlignNode> content)?  $default,) {final _that = this;
switch (_that) {
case _ChapterAlignNode() when $default != null:
return $default(_that.id,_that.title,_that.translatedTitle,_that.order,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterAlignNode implements ChapterAlignNode {
  const _ChapterAlignNode({required this.id, required this.title, required this.translatedTitle, required this.order, required final  List<ParagraphAlignNode> content}): _content = content;
  factory _ChapterAlignNode.fromJson(Map<String, dynamic> json) => _$ChapterAlignNodeFromJson(json);

@override final  String id;
@override final  String title;
@override final  String translatedTitle;
@override final  int order;
 final  List<ParagraphAlignNode> _content;
@override List<ParagraphAlignNode> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}


/// Create a copy of ChapterAlignNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterAlignNodeCopyWith<_ChapterAlignNode> get copyWith => __$ChapterAlignNodeCopyWithImpl<_ChapterAlignNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterAlignNodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterAlignNode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.translatedTitle, translatedTitle) || other.translatedTitle == translatedTitle)&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other._content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,translatedTitle,order,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'ChapterAlignNode(id: $id, title: $title, translatedTitle: $translatedTitle, order: $order, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ChapterAlignNodeCopyWith<$Res> implements $ChapterAlignNodeCopyWith<$Res> {
  factory _$ChapterAlignNodeCopyWith(_ChapterAlignNode value, $Res Function(_ChapterAlignNode) _then) = __$ChapterAlignNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String translatedTitle, int order, List<ParagraphAlignNode> content
});




}
/// @nodoc
class __$ChapterAlignNodeCopyWithImpl<$Res>
    implements _$ChapterAlignNodeCopyWith<$Res> {
  __$ChapterAlignNodeCopyWithImpl(this._self, this._then);

  final _ChapterAlignNode _self;
  final $Res Function(_ChapterAlignNode) _then;

/// Create a copy of ChapterAlignNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? translatedTitle = null,Object? order = null,Object? content = null,}) {
  return _then(_ChapterAlignNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,translatedTitle: null == translatedTitle ? _self.translatedTitle : translatedTitle // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<ParagraphAlignNode>,
  ));
}


}


/// @nodoc
mixin _$ParagraphAlignNode {

 String get op; String get tp; List<WordAlignNode> get aw;
/// Create a copy of ParagraphAlignNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParagraphAlignNodeCopyWith<ParagraphAlignNode> get copyWith => _$ParagraphAlignNodeCopyWithImpl<ParagraphAlignNode>(this as ParagraphAlignNode, _$identity);

  /// Serializes this ParagraphAlignNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParagraphAlignNode&&(identical(other.op, op) || other.op == op)&&(identical(other.tp, tp) || other.tp == tp)&&const DeepCollectionEquality().equals(other.aw, aw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,op,tp,const DeepCollectionEquality().hash(aw));

@override
String toString() {
  return 'ParagraphAlignNode(op: $op, tp: $tp, aw: $aw)';
}


}

/// @nodoc
abstract mixin class $ParagraphAlignNodeCopyWith<$Res>  {
  factory $ParagraphAlignNodeCopyWith(ParagraphAlignNode value, $Res Function(ParagraphAlignNode) _then) = _$ParagraphAlignNodeCopyWithImpl;
@useResult
$Res call({
 String op, String tp, List<WordAlignNode> aw
});




}
/// @nodoc
class _$ParagraphAlignNodeCopyWithImpl<$Res>
    implements $ParagraphAlignNodeCopyWith<$Res> {
  _$ParagraphAlignNodeCopyWithImpl(this._self, this._then);

  final ParagraphAlignNode _self;
  final $Res Function(ParagraphAlignNode) _then;

/// Create a copy of ParagraphAlignNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? op = null,Object? tp = null,Object? aw = null,}) {
  return _then(_self.copyWith(
op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as String,tp: null == tp ? _self.tp : tp // ignore: cast_nullable_to_non_nullable
as String,aw: null == aw ? _self.aw : aw // ignore: cast_nullable_to_non_nullable
as List<WordAlignNode>,
  ));
}

}


/// Adds pattern-matching-related methods to [ParagraphAlignNode].
extension ParagraphAlignNodePatterns on ParagraphAlignNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParagraphAlignNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParagraphAlignNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParagraphAlignNode value)  $default,){
final _that = this;
switch (_that) {
case _ParagraphAlignNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParagraphAlignNode value)?  $default,){
final _that = this;
switch (_that) {
case _ParagraphAlignNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String op,  String tp,  List<WordAlignNode> aw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParagraphAlignNode() when $default != null:
return $default(_that.op,_that.tp,_that.aw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String op,  String tp,  List<WordAlignNode> aw)  $default,) {final _that = this;
switch (_that) {
case _ParagraphAlignNode():
return $default(_that.op,_that.tp,_that.aw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String op,  String tp,  List<WordAlignNode> aw)?  $default,) {final _that = this;
switch (_that) {
case _ParagraphAlignNode() when $default != null:
return $default(_that.op,_that.tp,_that.aw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParagraphAlignNode implements ParagraphAlignNode {
  const _ParagraphAlignNode({required this.op, required this.tp, required final  List<WordAlignNode> aw}): _aw = aw;
  factory _ParagraphAlignNode.fromJson(Map<String, dynamic> json) => _$ParagraphAlignNodeFromJson(json);

@override final  String op;
@override final  String tp;
 final  List<WordAlignNode> _aw;
@override List<WordAlignNode> get aw {
  if (_aw is EqualUnmodifiableListView) return _aw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aw);
}


/// Create a copy of ParagraphAlignNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParagraphAlignNodeCopyWith<_ParagraphAlignNode> get copyWith => __$ParagraphAlignNodeCopyWithImpl<_ParagraphAlignNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParagraphAlignNodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParagraphAlignNode&&(identical(other.op, op) || other.op == op)&&(identical(other.tp, tp) || other.tp == tp)&&const DeepCollectionEquality().equals(other._aw, _aw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,op,tp,const DeepCollectionEquality().hash(_aw));

@override
String toString() {
  return 'ParagraphAlignNode(op: $op, tp: $tp, aw: $aw)';
}


}

/// @nodoc
abstract mixin class _$ParagraphAlignNodeCopyWith<$Res> implements $ParagraphAlignNodeCopyWith<$Res> {
  factory _$ParagraphAlignNodeCopyWith(_ParagraphAlignNode value, $Res Function(_ParagraphAlignNode) _then) = __$ParagraphAlignNodeCopyWithImpl;
@override @useResult
$Res call({
 String op, String tp, List<WordAlignNode> aw
});




}
/// @nodoc
class __$ParagraphAlignNodeCopyWithImpl<$Res>
    implements _$ParagraphAlignNodeCopyWith<$Res> {
  __$ParagraphAlignNodeCopyWithImpl(this._self, this._then);

  final _ParagraphAlignNode _self;
  final $Res Function(_ParagraphAlignNode) _then;

/// Create a copy of ParagraphAlignNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? op = null,Object? tp = null,Object? aw = null,}) {
  return _then(_ParagraphAlignNode(
op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as String,tp: null == tp ? _self.tp : tp // ignore: cast_nullable_to_non_nullable
as String,aw: null == aw ? _self._aw : aw // ignore: cast_nullable_to_non_nullable
as List<WordAlignNode>,
  ));
}


}


/// @nodoc
mixin _$WordAlignNode {

 List<int> get iow; List<int> get itw;
/// Create a copy of WordAlignNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordAlignNodeCopyWith<WordAlignNode> get copyWith => _$WordAlignNodeCopyWithImpl<WordAlignNode>(this as WordAlignNode, _$identity);

  /// Serializes this WordAlignNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordAlignNode&&const DeepCollectionEquality().equals(other.iow, iow)&&const DeepCollectionEquality().equals(other.itw, itw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(iow),const DeepCollectionEquality().hash(itw));

@override
String toString() {
  return 'WordAlignNode(iow: $iow, itw: $itw)';
}


}

/// @nodoc
abstract mixin class $WordAlignNodeCopyWith<$Res>  {
  factory $WordAlignNodeCopyWith(WordAlignNode value, $Res Function(WordAlignNode) _then) = _$WordAlignNodeCopyWithImpl;
@useResult
$Res call({
 List<int> iow, List<int> itw
});




}
/// @nodoc
class _$WordAlignNodeCopyWithImpl<$Res>
    implements $WordAlignNodeCopyWith<$Res> {
  _$WordAlignNodeCopyWithImpl(this._self, this._then);

  final WordAlignNode _self;
  final $Res Function(WordAlignNode) _then;

/// Create a copy of WordAlignNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iow = null,Object? itw = null,}) {
  return _then(_self.copyWith(
iow: null == iow ? _self.iow : iow // ignore: cast_nullable_to_non_nullable
as List<int>,itw: null == itw ? _self.itw : itw // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [WordAlignNode].
extension WordAlignNodePatterns on WordAlignNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordAlignNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordAlignNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordAlignNode value)  $default,){
final _that = this;
switch (_that) {
case _WordAlignNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordAlignNode value)?  $default,){
final _that = this;
switch (_that) {
case _WordAlignNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> iow,  List<int> itw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordAlignNode() when $default != null:
return $default(_that.iow,_that.itw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> iow,  List<int> itw)  $default,) {final _that = this;
switch (_that) {
case _WordAlignNode():
return $default(_that.iow,_that.itw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> iow,  List<int> itw)?  $default,) {final _that = this;
switch (_that) {
case _WordAlignNode() when $default != null:
return $default(_that.iow,_that.itw);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordAlignNode implements WordAlignNode {
  const _WordAlignNode({required final  List<int> iow, required final  List<int> itw}): _iow = iow,_itw = itw;
  factory _WordAlignNode.fromJson(Map<String, dynamic> json) => _$WordAlignNodeFromJson(json);

 final  List<int> _iow;
@override List<int> get iow {
  if (_iow is EqualUnmodifiableListView) return _iow;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_iow);
}

 final  List<int> _itw;
@override List<int> get itw {
  if (_itw is EqualUnmodifiableListView) return _itw;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itw);
}


/// Create a copy of WordAlignNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordAlignNodeCopyWith<_WordAlignNode> get copyWith => __$WordAlignNodeCopyWithImpl<_WordAlignNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordAlignNodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordAlignNode&&const DeepCollectionEquality().equals(other._iow, _iow)&&const DeepCollectionEquality().equals(other._itw, _itw));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_iow),const DeepCollectionEquality().hash(_itw));

@override
String toString() {
  return 'WordAlignNode(iow: $iow, itw: $itw)';
}


}

/// @nodoc
abstract mixin class _$WordAlignNodeCopyWith<$Res> implements $WordAlignNodeCopyWith<$Res> {
  factory _$WordAlignNodeCopyWith(_WordAlignNode value, $Res Function(_WordAlignNode) _then) = __$WordAlignNodeCopyWithImpl;
@override @useResult
$Res call({
 List<int> iow, List<int> itw
});




}
/// @nodoc
class __$WordAlignNodeCopyWithImpl<$Res>
    implements _$WordAlignNodeCopyWith<$Res> {
  __$WordAlignNodeCopyWithImpl(this._self, this._then);

  final _WordAlignNode _self;
  final $Res Function(_WordAlignNode) _then;

/// Create a copy of WordAlignNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iow = null,Object? itw = null,}) {
  return _then(_WordAlignNode(
iow: null == iow ? _self._iow : iow // ignore: cast_nullable_to_non_nullable
as List<int>,itw: null == itw ? _self._itw : itw // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
