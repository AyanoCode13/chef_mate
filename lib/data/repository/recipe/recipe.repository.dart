import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/domain/entity/recipe/recipeSummary/recipe.summary.dart';
import 'package:chef_mate/utils/result.dart';

abstract class RecipeRepository {
  Future<Result<List<RecipeSummary>>> searchRecipes({ required RecipeQuery query });
  Future<Result<List<String>>> getAutocomplete ({ required String query });
}