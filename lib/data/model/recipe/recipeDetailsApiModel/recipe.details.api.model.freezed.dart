// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.details.api.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeDetailsApiModel {

 String get title; String get summary; bool get vegan; bool get vegetarian; int get cookingMinutes; String get instructions;
/// Create a copy of RecipeDetailsApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailsApiModelCopyWith<RecipeDetailsApiModel> get copyWith => _$RecipeDetailsApiModelCopyWithImpl<RecipeDetailsApiModel>(this as RecipeDetailsApiModel, _$identity);

  /// Serializes this RecipeDetailsApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetailsApiModel&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.vegan, vegan) || other.vegan == vegan)&&(identical(other.vegetarian, vegetarian) || other.vegetarian == vegetarian)&&(identical(other.cookingMinutes, cookingMinutes) || other.cookingMinutes == cookingMinutes)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,summary,vegan,vegetarian,cookingMinutes,instructions);

@override
String toString() {
  return 'RecipeDetailsApiModel(title: $title, summary: $summary, vegan: $vegan, vegetarian: $vegetarian, cookingMinutes: $cookingMinutes, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $RecipeDetailsApiModelCopyWith<$Res>  {
  factory $RecipeDetailsApiModelCopyWith(RecipeDetailsApiModel value, $Res Function(RecipeDetailsApiModel) _then) = _$RecipeDetailsApiModelCopyWithImpl;
@useResult
$Res call({
 String title, String summary, bool vegan, bool vegetarian, int cookingMinutes, String instructions
});




}
/// @nodoc
class _$RecipeDetailsApiModelCopyWithImpl<$Res>
    implements $RecipeDetailsApiModelCopyWith<$Res> {
  _$RecipeDetailsApiModelCopyWithImpl(this._self, this._then);

  final RecipeDetailsApiModel _self;
  final $Res Function(RecipeDetailsApiModel) _then;

/// Create a copy of RecipeDetailsApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? summary = null,Object? vegan = null,Object? vegetarian = null,Object? cookingMinutes = null,Object? instructions = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,vegan: null == vegan ? _self.vegan : vegan // ignore: cast_nullable_to_non_nullable
as bool,vegetarian: null == vegetarian ? _self.vegetarian : vegetarian // ignore: cast_nullable_to_non_nullable
as bool,cookingMinutes: null == cookingMinutes ? _self.cookingMinutes : cookingMinutes // ignore: cast_nullable_to_non_nullable
as int,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeDetailsApiModel].
extension RecipeDetailsApiModelPatterns on RecipeDetailsApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDetailsApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDetailsApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDetailsApiModel value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDetailsApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDetailsApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDetailsApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String summary,  bool vegan,  bool vegetarian,  int cookingMinutes,  String instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDetailsApiModel() when $default != null:
return $default(_that.title,_that.summary,_that.vegan,_that.vegetarian,_that.cookingMinutes,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String summary,  bool vegan,  bool vegetarian,  int cookingMinutes,  String instructions)  $default,) {final _that = this;
switch (_that) {
case _RecipeDetailsApiModel():
return $default(_that.title,_that.summary,_that.vegan,_that.vegetarian,_that.cookingMinutes,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String summary,  bool vegan,  bool vegetarian,  int cookingMinutes,  String instructions)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDetailsApiModel() when $default != null:
return $default(_that.title,_that.summary,_that.vegan,_that.vegetarian,_that.cookingMinutes,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeDetailsApiModel implements RecipeDetailsApiModel {
  const _RecipeDetailsApiModel({required this.title, required this.summary, required this.vegan, required this.vegetarian, required this.cookingMinutes, required this.instructions});
  factory _RecipeDetailsApiModel.fromJson(Map<String, dynamic> json) => _$RecipeDetailsApiModelFromJson(json);

@override final  String title;
@override final  String summary;
@override final  bool vegan;
@override final  bool vegetarian;
@override final  int cookingMinutes;
@override final  String instructions;

/// Create a copy of RecipeDetailsApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDetailsApiModelCopyWith<_RecipeDetailsApiModel> get copyWith => __$RecipeDetailsApiModelCopyWithImpl<_RecipeDetailsApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDetailsApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDetailsApiModel&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.vegan, vegan) || other.vegan == vegan)&&(identical(other.vegetarian, vegetarian) || other.vegetarian == vegetarian)&&(identical(other.cookingMinutes, cookingMinutes) || other.cookingMinutes == cookingMinutes)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,summary,vegan,vegetarian,cookingMinutes,instructions);

@override
String toString() {
  return 'RecipeDetailsApiModel(title: $title, summary: $summary, vegan: $vegan, vegetarian: $vegetarian, cookingMinutes: $cookingMinutes, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$RecipeDetailsApiModelCopyWith<$Res> implements $RecipeDetailsApiModelCopyWith<$Res> {
  factory _$RecipeDetailsApiModelCopyWith(_RecipeDetailsApiModel value, $Res Function(_RecipeDetailsApiModel) _then) = __$RecipeDetailsApiModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String summary, bool vegan, bool vegetarian, int cookingMinutes, String instructions
});




}
/// @nodoc
class __$RecipeDetailsApiModelCopyWithImpl<$Res>
    implements _$RecipeDetailsApiModelCopyWith<$Res> {
  __$RecipeDetailsApiModelCopyWithImpl(this._self, this._then);

  final _RecipeDetailsApiModel _self;
  final $Res Function(_RecipeDetailsApiModel) _then;

/// Create a copy of RecipeDetailsApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? summary = null,Object? vegan = null,Object? vegetarian = null,Object? cookingMinutes = null,Object? instructions = null,}) {
  return _then(_RecipeDetailsApiModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,vegan: null == vegan ? _self.vegan : vegan // ignore: cast_nullable_to_non_nullable
as bool,vegetarian: null == vegetarian ? _self.vegetarian : vegetarian // ignore: cast_nullable_to_non_nullable
as bool,cookingMinutes: null == cookingMinutes ? _self.cookingMinutes : cookingMinutes // ignore: cast_nullable_to_non_nullable
as int,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
