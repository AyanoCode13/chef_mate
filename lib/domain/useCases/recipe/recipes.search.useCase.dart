import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/data/query/search.recipe.query.dart';
import 'package:chaf_mate_2/data/repository/recipe/recipe.api.repository.dart';
import 'package:chaf_mate_2/utils/result.dart';

final class SearchRecipesUseCase {
  final RecipeApiRepository _recipeRepository;

  SearchRecipesUseCase({required RecipeApiRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<RecipeApiModel>>> call({required RecipeQuery query}) async {
    return await _recipeRepository.searchRecipes(query: query);
  }
}
