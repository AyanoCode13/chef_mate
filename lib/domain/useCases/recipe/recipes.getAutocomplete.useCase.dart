

import 'package:chaf_mate_2/data/repository/recipe/recipe.api.repository.dart';
import 'package:chaf_mate_2/domain/useCases/use_case.dart';
import 'package:chaf_mate_2/utils/result.dart';

final class GetRecipesAutocompleteUseCase extends UseCase<String,List<String>>{
  final RecipeApiRepository _recipeRepository;
  GetRecipesAutocompleteUseCase({required RecipeApiRepository recipeRepository}) : _recipeRepository = recipeRepository;
  
  @override
  Future<Result<List<String>>> call({required String arg}) async {
    // TODO: implement call
    return await _recipeRepository.getSuggestions(query: arg);
  }
}