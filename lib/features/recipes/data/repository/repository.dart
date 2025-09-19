import 'package:chef_mate/features/recipes/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipes/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

abstract class RecipeRepository {
  Future<Result<List<RecipeSummary>>> searchRecipes({required RecipeQuery query});
  Future<Result<List<RecipeSummary>>> searchRecipesByIngredients({required List<String> ingredients});
  Future<Result<List<RecipeSummary>>> searchRecipesByNutrients();
  Future<Result<List<String>>> getRecipesAutocomplete({ required String query});
}
