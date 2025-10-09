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
      query: query.toQueryParameters()
    );
    print(res);
    if (res != null) {
      return (res["results"] as List)
          .map((el) => RecipeApiModel.fromJson(el))
          .toList();
    }
    return [];
  }  
   Future<List<String>> getSuggestions({ required String query}) async {
    final res = await sendGetRequest(path:dotenv.env["RECIPE_AUTOCOMPLETE_PATH"]!,
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
  /*
    Categories
  */
  Future<List<RecipeApiModel>> getVeganAndVegetarianRecipes() async {
     final res = await sendGetRequest(
      path: dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!,
      query: RecipeQuery(diet: "vegan|vegetarian", addRecipeInformation: true, number: 10).toQueryParameters(),
    );
    
    if (res != null) {
      return (res["results"] as List)
          .map((el) => RecipeApiModel.fromJson(el))
          .toList();
    }
    return [];
  }

  // Future<Map<String,dynamic>> getItalianRecipes() async {
  //   return await sendGetRequest(path: dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!, query: {"cuisine": "italian"});
  // }
  // Future<Map<String,dynamic>> getFrenchRecipes() async {
  //   return await sendGetRequest(path: dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!, query: {"cuisine": "french"});
  // }
  //  Future<Map<String,dynamic>> getIndianRecipes() async {
  //   return await sendGetRequest(path: dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!, query: {"cuisine": "indian"});
  // }
  
}
