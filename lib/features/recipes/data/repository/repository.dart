import 'package:chef_mate/features/recipes/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

abstract class Repository {
  Future<Result<List<RecipeSummary>>> searchRecipes();
  Future<Result<List<RecipeSummary>>> searchRecipesByIngredients({required List<String> ingredients});
  Future<Result<List<RecipeSummary>>> searchRecipesByNutrients();

}
