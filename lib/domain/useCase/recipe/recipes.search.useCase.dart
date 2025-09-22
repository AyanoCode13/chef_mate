import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/data/repository/recipe/recipe.repository.dart';
import 'package:chef_mate/domain/entity/recipe/recipeSummary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

final class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<RecipeSummary>>> call({required RecipeQuery query}) async {
    return await _recipeRepository.searchRecipes(query: query);
  }
}
