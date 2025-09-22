
import 'package:chef_mate/data/repository/recipe/recipe.repository.dart';
import 'package:chef_mate/domain/useCase/use_case.dart';
import 'package:chef_mate/utils/result.dart';

final class GetRecipesAutocompleteUseCase extends UseCase<String,List<String>>{
  final RecipeRepository _recipeRepository;
  GetRecipesAutocompleteUseCase({required RecipeRepository recipeRepository}) : _recipeRepository = recipeRepository;
  
  @override
  Future<Result<List<String>>> call({required String arg}) async {
    // TODO: implement call
    return await _recipeRepository.getAutocomplete(query: arg);
  }
}