// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.summary.api.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeSummaryApiModel {

 int get id; String get title; String get image;
/// Create a copy of RecipeSummaryApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeSummaryApiModelCopyWith<RecipeSummaryApiModel> get copyWith => _$RecipeSummaryApiModelCopyWithImpl<RecipeSummaryApiModel>(this as RecipeSummaryApiModel, _$identity);

  /// Serializes this RecipeSummaryApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeSummaryApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image);

@override
String toString() {
  return 'RecipeSummaryApiModel(id: $id, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class $RecipeSummaryApiModelCopyWith<$Res>  {
  factory $RecipeSummaryApiModelCopyWith(RecipeSummaryApiModel value, $Res Function(RecipeSummaryApiModel) _then) = _$RecipeSummaryApiModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String image
});




}
/// @nodoc
class _$RecipeSummaryApiModelCopyWithImpl<$Res>
    implements $RecipeSummaryApiModelCopyWith<$Res> {
  _$RecipeSummaryApiModelCopyWithImpl(this._self, this._then);

  final RecipeSummaryApiModel _self;
  final $Res Function(RecipeSummaryApiModel) _then;

/// Create a copy of RecipeSummaryApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeSummaryApiModel].
extension RecipeSummaryApiModelPatterns on RecipeSummaryApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeSummaryApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeSummaryApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeSummaryApiModel value)  $default,){
final _that = this;
switch (_that) {
case _RecipeSummaryApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeSummaryApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeSummaryApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeSummaryApiModel() when $default != null:
return $default(_that.id,_that.title,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String image)  $default,) {final _that = this;
switch (_that) {
case _RecipeSummaryApiModel():
return $default(_that.id,_that.title,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String image)?  $default,) {final _that = this;
switch (_that) {
case _RecipeSummaryApiModel() when $default != null:
return $default(_that.id,_that.title,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeSummaryApiModel implements RecipeSummaryApiModel {
  const _RecipeSummaryApiModel({required this.id, required this.title, required this.image});
  factory _RecipeSummaryApiModel.fromJson(Map<String, dynamic> json) => _$RecipeSummaryApiModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String image;

/// Create a copy of RecipeSummaryApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeSummaryApiModelCopyWith<_RecipeSummaryApiModel> get copyWith => __$RecipeSummaryApiModelCopyWithImpl<_RecipeSummaryApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeSummaryApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeSummaryApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image);

@override
String toString() {
  return 'RecipeSummaryApiModel(id: $id, title: $title, image: $image)';
}


}

/// @nodoc
abstract mixin class _$RecipeSummaryApiModelCopyWith<$Res> implements $RecipeSummaryApiModelCopyWith<$Res> {
  factory _$RecipeSummaryApiModelCopyWith(_RecipeSummaryApiModel value, $Res Function(_RecipeSummaryApiModel) _then) = __$RecipeSummaryApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String image
});




}
/// @nodoc
class __$RecipeSummaryApiModelCopyWithImpl<$Res>
    implements _$RecipeSummaryApiModelCopyWith<$Res> {
  __$RecipeSummaryApiModelCopyWithImpl(this._self, this._then);

  final _RecipeSummaryApiModel _self;
  final $Res Function(_RecipeSummaryApiModel) _then;

/// Create a copy of RecipeSummaryApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = null,}) {
  return _then(_RecipeSummaryApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
