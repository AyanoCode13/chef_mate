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
      usedIngredients:
          (json['usedIngredients'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      missedIngredients:
          (json['missedIngredients'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecipeApiModelToJson(_RecipeApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'usedIngredients': instance.usedIngredients,
      'missedIngredients': instance.missedIngredients,
    };
