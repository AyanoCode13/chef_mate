import 'package:chef_mate/features/recipes/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipes/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/features/recipes/domain/useCase/recipes.getAutocomplete.useCase.dart';
import 'package:chef_mate/features/recipes/domain/useCase/recipes.search.useCase.dart';
import 'package:chef_mate/features/recipes/domain/useCase/recipes.searchByIngredients.useCase.dart';
import 'package:chef_mate/utils/command.dart';
import 'package:chef_mate/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class  RecipeNotifier extends ChangeNotifier {
  final SearchRecipesByIngredientsUseCase _searchRecipesByIngredientsUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;
  final GetRecipesAutocompleteUseCase _getRecipesAutocompleteUseCase;
  RecipeNotifier({
    required GetRecipesAutocompleteUseCase getRecipesAutocompleteUseCase,
    required SearchRecipesByIngredientsUseCase searchRecipesByIngredientsUseCase,
    required SearchRecipesUseCase searchRecipesUseCase
    }) : 
    _getRecipesAutocompleteUseCase = getRecipesAutocompleteUseCase,
    _searchRecipesByIngredientsUseCase = searchRecipesByIngredientsUseCase,
    _searchRecipesUseCase = searchRecipesUseCase {
    searchByIngredientsCommand = ComplexCommand(_searchByIngredients);
    load = ComplexCommand(_searchRecipes)..execute(arg: RecipeQuery());
    searchRecipes = ComplexCommand(_searchRecipes);
    getAutocomplete = ComplexCommand(_getAutoComplete);
    simulateSearch = BasicCommand(_simutaleSearch);
    
  }

  late final ComplexCommand<void,List<String>> searchByIngredientsCommand;
  late final ComplexCommand<void, RecipeQuery> load;
  late final ComplexCommand<void, RecipeQuery> searchRecipes;
  late final ComplexCommand<void, String> getAutocomplete;
  late final BasicCommand simulateSearch;
 

  final Logger _logger = Logger();

  late List<RecipeSummary> _recipes = [];
  List<RecipeSummary> get recipes => _recipes;

  late List<String> _suggestions = [];
  List<String> get suggestions => _suggestions;

  Future<Result<void>> _searchRecipes(RecipeQuery query) async {
    _logger.i(query.offset);
    try{
      _logger.i("Load more");
      final res = await _searchRecipesUseCase.call(query: query);
      switch(res){
        case Ok<List<RecipeSummary>>():{
         _recipes.addAll(res.value);
          
          _logger.i(_recipes);
          return Result.ok(null);

        }
        case Error<List<RecipeSummary>>():{
          return Result.error(res.error);
        }
      }
    }
    finally{
      notifyListeners();
    }
  }

  Future<Result<void>> _searchByIngredients(List<String> ingredients) async{
    try{
      final Result<List<RecipeSummary>> res = await _searchRecipesByIngredientsUseCase(ingredients: ingredients);
      switch(res){
        case Ok<List<RecipeSummary>>():{
          _recipes = res.value;
          return Result.ok(_recipes);
        }
        case Error<List<RecipeSummary>>():{
          return Result.error(res.error);
        }
      }
    }
    finally{
      notifyListeners();
    } 
  }

  Future<Result<void>> _getAutoComplete (String query) async {
    try{
      final res = await _getRecipesAutocompleteUseCase.call(query: query);
      switch(res){
        case Ok<List<String>>():{
          _suggestions = res.value;
          _logger.i(_suggestions);
          return Result.ok(null);
        }
        case Error<List<String>>():{
          return Result.error(res.error);
        }
      }
    }
    finally{
      notifyListeners();
    }

  }

  Future<Result<void>> _simutaleSearch() async {
    await Future.delayed(Duration(seconds: 5));
    print("Searching");
    return Result.ok(null);
  }

}
