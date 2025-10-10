import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/data/repository/recipe/recipe.api.repository.dart';
import 'package:chaf_mate_2/domain/useCases/use_case.dart';
import 'package:chaf_mate_2/utils/result.dart';

final class GetRecipeByIdUseCase extends UseCase<int, RecipeApiModel> {
  final RecipeApiRepository _recipeApiRepository;

  GetRecipeByIdUseCase({required RecipeApiRepository recipeApiRepository}) : _recipeApiRepository = recipeApiRepository;
  
  @override
  Future<Result<RecipeApiModel>> call({required int arg}) async {
    // TODO: implement call
    return await _recipeApiRepository.getById(id: arg);
  }
  
}