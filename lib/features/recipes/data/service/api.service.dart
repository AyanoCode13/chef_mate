import 'dart:convert';

import 'package:chef_mate/features/recipes/data/models/api/recipe.api.model.dart';
import 'package:chef_mate/features/recipes/data/query/search.recipe.query.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;



class RecipeApiService {
  

  /*
    @param ingredients List of ingredients to search for
    @param limit Number of recipes to return

  */
  Future<List<RecipeApiModel>> findRecipesByIngredients({required List<String> ingredients, int limit = 10, bool ignorePantry = false, int ranking = 1}) async {
    try {
      
      final uri = Uri.https(
        dotenv.env['BASE_URL']!, 
        '/recipes/findByIngredients', 
        {
        'ingredients': ingredients.join(','),
        'number': limit.toString(),
        'limitLicense': 'true',
        'ranking': ranking.toString(),
        'ignorePantry': ignorePantry.toString(),
      }
    );
      final res = await http.get(
        uri,
        headers: {
          'X-API-KEY': dotenv.env['API_KEY']!, 
          'Content-Type': 'application/json'
        },
      );
      final data = jsonDecode(res.body) as List;
      return data.map((elem) => RecipeApiModel.fromJson(elem)).toList();
    } on Exception catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }
  Future<List<RecipeApiModel>> searchRecipes({required RecipeQuery query}) async {
    
    try{
      final uri = Uri.https(
        dotenv.env['BASE_URL']!,
        'recipes/complexSearch',
        query.toQueryParameters()
      );

      final res = await http.get(
        uri,
        headers:{
          'X-API-KEY': dotenv.env['API_KEY']!,
          'Content-Type': 'application/json'
        }
      );
      final data = jsonDecode(res.body);
      final List recipes = data['results'] as List;
      return recipes.map((elem) => RecipeApiModel.fromJson(elem)).toList();
      
    } on Exception catch (e){
      throw Exception('Failed to load recipes: $e');
    }
  }

  Future<List<Map<String,dynamic>>> googleSearchRecipes() async {
    try{
      final res = await http.get(
        Uri.parse("https://serpapi.com/search.json?q=Cheesecake&location=Austin,Texas,United+States&hl=en&gl=us&api_key=${dotenv.env['GOOGLE_SEARCH_API_KEY']}"),
        headers:{
          'Content-Type': 'application/json'
        }
      );
      final data = jsonDecode(res.body);
      final List recipes = data['recipes_results'] as List;
      List<String> links = recipes.map<String>((e) => e['link'] as String).toList();
      
      print(recipes);
    
      Map<String, String> json = {
        'links':links.join(','),
        
      };
      print(json);
      return [];
    } on Exception catch (e){
      throw Exception('Failed to load recipes: $e');
    }
  }


}
