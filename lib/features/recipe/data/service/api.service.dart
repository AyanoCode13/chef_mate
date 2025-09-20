import 'dart:convert';
import 'dart:isolate';

import 'package:chef_mate/features/recipe/data/models/api/recipeDetailsApiModel/recipe.details.api.model.dart';
import 'package:chef_mate/features/recipe/data/models/api/recipeSummaryApiModel/recipe.summary.api.model.dart';
import 'package:chef_mate/features/recipe/data/query/search.recipe.query.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RecipeApiService {
  /*
    @param ingredients List of ingredients to search for
    @param limit Number of recipes to return

  */

  final String _apiKey;
  final String _baseURL;
  late Map<String, String>? _headers;
  final String _searchByIngredientsPath;
  final String _searchByIdPath;
  final String _complexSearchPath;
  final String _autocompletePath;

  RecipeApiService()
    : _apiKey = dotenv.env['RECIPE_API_KEY']!,
      _baseURL = dotenv.env['RECIPE_API_BASE_URL']!,
      _searchByIngredientsPath =
          dotenv.env["RECIPE_SEARCH_BY_INGREDIENTS_PATH"]!,
      _searchByIdPath = dotenv.env['RECIPE_SEARCH_BY_ID_PATH']!,
      _complexSearchPath = dotenv.env["RECIPE_COMPLEX_SEARCH_PATH"]!,
      _autocompletePath = dotenv.env['RECIPE_AUTOCOMPLETE_PATH']! {
    _headers = {'X-API-KEY': _apiKey, 'Content-Type': 'application/json'};
  }

  Future<List<RecipeSummaryApiModel>> findRecipesByIngredients({
    required List<String> ingredients,
    int limit = 10,
    bool ignorePantry = false,
    int ranking = 1,
  }) async {
    try {
      final uri = Uri.https(_baseURL, _searchByIngredientsPath, {
        'ingredients': ingredients.join(','),
        'number': limit.toString(),
        'limitLicense': 'true',
        'ranking': ranking.toString(),
        'ignorePantry': ignorePantry.toString(),
      });
      final res = await http.get(uri, headers: _headers);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as List;
        return data
            .map((elem) => RecipeSummaryApiModel.fromJson(elem))
            .toList();
      }
      return [];
    } on Exception catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }

  Future<List<RecipeSummaryApiModel>> searchRecipes({
    required RecipeQuery query,
  }) async {
    try {
      final uri = Uri.https(
        _baseURL,
        _complexSearchPath,
        query.toQueryParameters(),
      );

      final res = await http.get(uri, headers: _headers);
      if (res.statusCode == 200) {
        final data = await _decodeJSON(data: res.body);
        final List recipes = data['results'] as List;
        return recipes
            .map((elem) => RecipeSummaryApiModel.fromJson(elem))
            .toList();
      }
      return [];
    } on Exception catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }

  Future<List<String>> getRecipesAutocomplete({required String query}) async {
    final uri = Uri.https(_baseURL, _autocompletePath, {'query': query});

    final res = await http.get(uri, headers: _headers);
    if (res.statusCode == 200) {
      print(res.body);
      final List data = await _decodeJSON(data: res.body);
      return data.map((result) => result["title"] as String).toList();
    }
    return [];
  }

  Future<RecipeDetailsApiModel> getById({required String id}) async {
    try {
      final uri = Uri.https(_baseURL, _searchByIdPath.replaceFirst("id", id));

      final res = await http.get(uri, headers: _headers);
      final data = await _decodeJSON(data: res.body);
      return RecipeDetailsApiModel.fromJson(data);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> _decodeJSON({required String data}) async {
    return await Isolate.run(() {
      return json.decode(data);
    });
  }
}
