import 'package:chef_mate/features/recipes/data/repository/repository.dart';
import 'package:chef_mate/features/recipes/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

final class SearchRecipesByIngredientsUseCase {
  final Repository _repository;
  SearchRecipesByIngredientsUseCase({required Repository repository}) : _repository = repository;

  Future<Result<List<RecipeSummary>>> call({required List<String> ingredients}) async {
    return await _repository.searchRecipesByIngredients(ingredients: ingredients);
  }
}