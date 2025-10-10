import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/data/query/search.recipe.query.dart';
import 'package:chaf_mate_2/data/service/api/recipe.api.service.dart';
import 'package:chaf_mate_2/utils/result.dart';

class RecipeApiRepository {
  final RecipeApiService _recipeApiService;
  RecipeApiRepository({required RecipeApiService recipeApiService})
    : _recipeApiService = recipeApiService;

  Future<Result<List<RecipeApiModel>>> searchRecipes({
    required RecipeQuery query,
  }) async {
    try {
      final res = await _recipeApiService.searchRecipes(query: query);
      return Result.ok(res);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<RecipeApiModel>> getById({required int id}) async {
    try {
      final res = await _recipeApiService.getById(id: id);
      return Result.ok(res);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<String>>> getSuggestions({required String query}) async {
    try {
      final res = await _recipeApiService.getSuggestions(query: query);
      return Result.ok(res);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
