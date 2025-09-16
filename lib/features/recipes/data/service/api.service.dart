import 'dart:convert';
import 'package:chef_mate/features/recipes/data/models/api/recipe.api.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RecipeApiService {
  Future<List<RecipeApiModel>> findRecipesByIngredients({required List<String> ingredients, int limit = 10, bool ignorePantry = false, int ranking = 1}) async {
    try {
      final apiKey = dotenv.env['API_KEY'];
      final baseUrl = dotenv.env['BASE_URL'];
      final uri = Uri.https(baseUrl!, '/recipes/findByIngredients', {
        'ingredients': ingredients.join(','),
        'number': limit.toString(),
        'limitLicense': 'true',
        'ranking': ranking.toString(),
        'ignorePantry': ignorePantry.toString(),
      });
      final res = await http.get(
        uri,
        headers: {'X-API-KEY': apiKey!, 'Content-Type': 'application/json'},
      );
      final data = jsonDecode(res.body) as List;
      return data.map((elem) => RecipeApiModel.fromJson(elem)).toList();
    } on Exception catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }
}
