import 'package:chaf_mate_2/data/repository/recipe/recipe.api.repository.dart';
final class SearchRecipesByIngredientsUseCase {
  final RecipeApiRepository _repository;
  SearchRecipesByIngredientsUseCase({required RecipeApiRepository repository}) : _repository = repository;

}