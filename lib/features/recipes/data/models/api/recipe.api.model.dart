// recipe.dart
import 'package:freezed_annotation/freezed_annotation.dart';

// These are the generated files
part 'recipe.api.model.freezed.dart';
part 'recipe.api.model.g.dart';  // Only if using JSON serialization

@freezed
abstract class RecipeApiModel with _$RecipeApiModel {
  const factory RecipeApiModel({
    required int id,
    required String title,
    required String image,
    @Default([]) List<Map<String,dynamic>> usedIngredients,  
    @Default([]) List<Map<String,dynamic>> missedIngredients,  
   
  }) = _RecipeApiModel;

  factory RecipeApiModel.fromJson(Map<String, dynamic> json) => _$RecipeApiModelFromJson(json);
  
}