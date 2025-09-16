import 'package:chef_mate/features/recipes/data/repository/repository.dart';
import 'package:chef_mate/features/recipes/data/service/api.service.dart';
import 'package:chef_mate/features/recipes/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

class RecipeApiRepository implements Repository{
  final RecipeApiService _apiService;

  RecipeApiRepository({required RecipeApiService apiService}) : _apiService = apiService;
  
  @override
  Future<Result<List<RecipeSummary>>> searchRecipesByIngredients({required List<String> ingredients}) async{
    // TODO: implement searchRecipesByIngredients
    try{
      final res = await _apiService.findRecipesByIngredients(ingredients: []);
      
      return Result.ok(
        res.map((recipeApiModel)=> 
        RecipeSummary(
          id: recipeApiModel.id.toString(), 
          title: recipeApiModel.title, 
          imageUrl: recipeApiModel.image
        )).toList()
      );
    } on Exception catch (e){
      return Result.error(e);
    }
  }
  
  @override
  Future<Result<List<RecipeSummary>>> searchRecipes() {
    // TODO: implement searchRecipes
    throw UnimplementedError();
  }
  
  @override
  Future<Result<List<RecipeSummary>>> searchRecipesByNutrients() {
    // TODO: implement searchRecipesByNutrients
    throw UnimplementedError();
  }
  
  

 
}