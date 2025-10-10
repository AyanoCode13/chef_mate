import 'dart:async';

import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/data/query/search.recipe.query.dart';
import 'package:chaf_mate_2/data/service/api/api.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class RecipeApiService extends ApiService {
  RecipeApiService()
    : super(
        apiKey: dotenv.env["SPOONTACULAR_API_KEY"]!,
        baseUrl: dotenv.env["SPOONTACULAR_API_BASE_URL"]!,
      );
  Future<List<RecipeApiModel>> searchRecipes({
    required RecipeQuery query,
  }) async {
    final res = await sendGetRequest(
      path: dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!,
      query: query.toQueryParameters(),
    );
    print(res);
    if (res != null) {
      return (res["results"] as List)
          .map((el) => RecipeApiModel.fromJson(el))
          .toList();
    }
    return [];
  }
  Future<RecipeApiModel> getById({
    required int id
  }) async {
    final res = await sendGetRequest(
      path: dotenv.env["RECIPE_SEARCH_BY_ID_PATH"]!.replaceFirst(':id', id.toString()),
    );
    return RecipeApiModel.fromJson(res);
  }

  Future<List<String>> getSuggestions({required String query}) async {
    final res = await sendGetRequest(
      path: dotenv.env["RECIPE_AUTOCOMPLETE_PATH"]!,
      query: {"query": query},
    );
    if (res != null) {
      return (res as List).map((el) => el["title"] as String).toList();
    }
    return [];
  }

  /*
    Categories
  */
}
