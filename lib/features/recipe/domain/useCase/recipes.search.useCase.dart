import 'package:chef_mate/features/recipe/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipe/data/repository/repository.dart';
import 'package:chef_mate/features/recipe/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

final class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipesUseCase({required RecipeRepository recipeRepository}) : _recipeRepository = recipeRepository;

  Future<Result<List<RecipeSummary>>> call({ required RecipeQuery query}) async {
    return await _recipeRepository.searchRecipes(query: query);
  }


  
}