import 'dart:async';
import 'package:chef_mate/data/model/recipe/recipeSummaryApiModel/recipe.summary.api.model.dart';
import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/data/service/api/api.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class RecipeApiService extends ApiService {
  RecipeApiService()
    : super(
        apiKey: dotenv.env["SPOONTACULAR_API_KEY"]!,
        baseUrl: dotenv.env["SPOONTACULAR_API_BASE_URL"]!,
      );
  Future<List<RecipeSummaryApiModel>> searchRecipes({
    required RecipeQuery query,
  }) async {
    // final res = await sendRequest(
    //   path: dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!,
    //   query: query.toQueryParameters()
    // );
    // print(res);
    // if (res != null) {
    //   return (res["results"] as List)
    //       .map((el) => RecipeSummaryApiModel.fromJson(el))
    //       .toList();
    // }
    return [];
  }

  Future<List<String>> getSuggestions({ required String query}) async {
    final res = await sendRequest(path:dotenv.env["RECIPE_AUTOCOMPLETE_PATH"]!,
      query: {
        "query": query,
      }
    );
    if (res != null) {
      return (res as List)
          .map((el) => el["title"] as String)
          .toList();
    }
    return[];
  }
}
