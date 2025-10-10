import 'dart:async';

import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/data/query/search.recipe.query.dart';
import 'package:chaf_mate_2/data/service/api/api.service.dart';
import 'package:chaf_mate_2/env.dart';

final class RecipeApiService extends ApiService {
  RecipeApiService()
    : super(
        apiKey: Env.apiKey,
        baseUrl: Env.baseUrl,
      );
  Future<List<RecipeApiModel>> searchRecipes({
    required RecipeQuery query,
  }) async {
    final res = await sendGetRequest(
      path: Env.search,
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
      path: Env.getById(id)
    );
    return RecipeApiModel.fromJson(res);
  }

  Future<List<String>> getSuggestions({required String query}) async {
    final res = await sendGetRequest(
      path: Env.autocomplete,
      query: {"query": query},
    );
    if (res != null) {
      return (res as List).map((el) => el["title"] as String).toList();
    }
    return [];
  }
}
