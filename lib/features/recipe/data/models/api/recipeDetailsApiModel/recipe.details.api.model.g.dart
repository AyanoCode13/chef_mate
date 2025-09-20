// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.details.api.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeDetailsApiModel _$RecipeDetailsApiModelFromJson(
  Map<String, dynamic> json,
) => _RecipeDetailsApiModel(
  title: json['title'] as String,
  summary: json['summary'] as String,
  vegan: json['vegan'] as bool,
  vegetarian: json['vegetarian'] as bool,
  cookingMinutes: (json['cookingMinutes'] as num).toInt(),
  instructions: json['instructions'] as String,
);

Map<String, dynamic> _$RecipeDetailsApiModelToJson(
  _RecipeDetailsApiModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'summary': instance.summary,
  'vegan': instance.vegan,
  'vegetarian': instance.vegetarian,
  'cookingMinutes': instance.cookingMinutes,
  'instructions': instance.instructions,
};
