import 'package:chef_mate/features/recipes/data/repository/repository.dart';
import 'package:chef_mate/utils/result.dart';

final class GetRecipesAutocompleteUseCase{
  final RecipeRepository _recipeRepository;
  GetRecipesAutocompleteUseCase({required RecipeRepository recipeRepository}) : _recipeRepository = recipeRepository;

  Future<Result<List<String>>> call({ required String query}) async {
    return await _recipeRepository.getRecipesAutocomplete(query: query);
  }
}