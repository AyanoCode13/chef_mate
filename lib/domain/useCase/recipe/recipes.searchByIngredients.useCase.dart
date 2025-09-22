import 'package:chef_mate/data/repository/recipe/recipe.repository.dart';

final class SearchRecipesByIngredientsUseCase {
  final RecipeRepository _repository;
  SearchRecipesByIngredientsUseCase({required RecipeRepository repository}) : _repository = repository;

}