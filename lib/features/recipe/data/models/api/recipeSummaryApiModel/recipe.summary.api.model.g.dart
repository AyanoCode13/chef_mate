// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.summary.api.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeSummaryApiModel _$RecipeSummaryApiModelFromJson(
  Map<String, dynamic> json,
) => _RecipeSummaryApiModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$RecipeSummaryApiModelToJson(
  _RecipeSummaryApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
};
