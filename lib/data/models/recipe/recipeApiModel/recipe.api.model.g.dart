// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.api.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeApiModel _$RecipeApiModelFromJson(Map<String, dynamic> json) =>
    _RecipeApiModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: (json['readyInMinutes'] as num).toInt(),
      vegan: json['vegan'] as bool,
      vegetarian: json['vegetarian'] as bool,
      glutenFree: json['glutenFree'] as bool,
      dairyFree: json['dairyFree'] as bool,
      servings: (json['servings'] as num).toInt(),
      sourceUrl: json['sourceUrl'] as String,
    );

Map<String, dynamic> _$RecipeApiModelToJson(_RecipeApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'readyInMinutes': instance.readyInMinutes,
      'vegan': instance.vegan,
      'vegetarian': instance.vegetarian,
      'glutenFree': instance.glutenFree,
      'dairyFree': instance.dairyFree,
      'servings': instance.servings,
      'sourceUrl': instance.sourceUrl,
    };
