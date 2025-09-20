import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipe.details.api.model.freezed.dart';
part 'recipe.details.api.model.g.dart'; 

@freezed
abstract class RecipeDetailsApiModel with _$RecipeDetailsApiModel {
  const factory RecipeDetailsApiModel ({
    required String title,
    required String summary,
    required bool vegan,
    required bool vegetarian,
    required int cookingMinutes,
    required String instructions
  }) = _RecipeDetailsApiModel;
  factory RecipeDetailsApiModel.fromJson(Map<String, dynamic> json) => _$RecipeDetailsApiModelFromJson(json);
}