import 'package:chef_mate/features/recipe/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipe/data/repository/repository.dart';
import 'package:chef_mate/features/recipe/data/service/api.service.dart';
import 'package:chef_mate/features/recipe/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

class RecipeApiRepository implements RecipeRepository {
  final RecipeApiService _apiService;

  RecipeApiRepository({required RecipeApiService apiService})
    : _apiService = apiService;

  @override
  Future<Result<List<RecipeSummary>>> searchRecipesByIngredients({
    required List<String> ingredients,
  }) async {
    // TODO: implement searchRecipesByIngredients
    try {
      final res = await _apiService.findRecipesByIngredients(ingredients: []);
      print(res);

      return Result.ok(
        res
            .map(
              (recipeApiModel) => RecipeSummary(
                id: recipeApiModel.id.toString(),
                title: recipeApiModel.title,
                imageUrl: recipeApiModel.image,
              ),
            )
            .toList(),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<RecipeSummary>>> searchRecipesByNutrients() {
    // TODO: implement searchRecipesByNutrients
    throw UnimplementedError();
  }

  @override
  Future<Result<List<RecipeSummary>>> searchRecipes({
    required RecipeQuery query,
  }) async {
    // TODO: implement searchRecipes
    try {
      final res = await _apiService.searchRecipes(query: query);
      print(res);
      return Result.ok(
        res
            .map(
              (recipeApiModel) => RecipeSummary(
                id: recipeApiModel.id.toString(),
                title: recipeApiModel.title,
                imageUrl: recipeApiModel.image,
              ),
            )
            .toList(),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<String>>> getRecipesAutocomplete({
    required String query,
  }) async {
    try {
      final res = await _apiService.getRecipesAutocomplete(query: query);
      return Result.ok(res);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
