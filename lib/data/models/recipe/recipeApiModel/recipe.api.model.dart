import 'package:freezed_annotation/freezed_annotation.dart';
part "recipe.api.model.freezed.dart";
part 'recipe.api.model.g.dart';

@freezed
abstract class RecipeApiModel with _$RecipeApiModel {
  const factory RecipeApiModel({
    required int id,
    required String title,
    required String image,
  }) = _RecipeApiModel;

  factory RecipeApiModel.fromJson(Map<String, dynamic> json) => _$RecipeApiModelFromJson(json);
}