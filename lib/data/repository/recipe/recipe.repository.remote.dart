import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/data/repository/recipe/recipe.repository.dart';
import 'package:chef_mate/data/service/api/recipe.api.service.dart';
import 'package:chef_mate/domain/entity/recipe/recipeSummary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

final class RecipeApiRepository implements RecipeRepository{
  final RecipeApiService _apiService;

  RecipeApiRepository({required RecipeApiService apiService}) : _apiService = apiService;
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
  
  @override
  Future<Result<List<String>>> getAutocomplete({required String query}) {
    // TODO: implement getAutocomplete
    throw UnimplementedError();
  }
  
}