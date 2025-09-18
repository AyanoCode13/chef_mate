import 'package:chef_mate/features/recipes/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipes/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/features/recipes/domain/useCase/recipes.search.useCase.dart';
import 'package:chef_mate/features/recipes/domain/useCase/recipes.searchByIngredients.useCase.dart';
import 'package:chef_mate/utils/command.dart';
import 'package:chef_mate/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class  RecipeNotifier extends ChangeNotifier {
  final SearchRecipesByIngredientsUseCase _searchRecipesByIngredientsUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;
  RecipeNotifier({
    required SearchRecipesByIngredientsUseCase searchRecipesByIngredientsUseCase,
    required SearchRecipesUseCase searchRecipesUseCase
    }) : 
    _searchRecipesByIngredientsUseCase = searchRecipesByIngredientsUseCase,
    _searchRecipesUseCase = searchRecipesUseCase {
    searchByIngredientsCommand = ComplexCommand(_searchByIngredients);
    load = ComplexCommand(_searchRecipes)..execute(arg: RecipeQuery());
    searchRecipes = ComplexCommand(_searchRecipes);
    simulateSearch = BasicCommand(_simutaleSearch);
    
  }

  late final ComplexCommand<void,List<String>> searchByIngredientsCommand;
  late final ComplexCommand<void, RecipeQuery> load;
  late final ComplexCommand<void, RecipeQuery> searchRecipes;
  late final BasicCommand simulateSearch;
  final Logger _logger = Logger();
  late List<RecipeSummary> _recipes = [];
  List<RecipeSummary> get recipes => _recipes;

  Future<Result<void>> _searchRecipes(RecipeQuery query) async {
    try{
      _logger.i("Load more");
      final res = await _searchRecipesUseCase.call(query: query);
      switch(res){
        case Ok<List<RecipeSummary>>():{
          _recipes = res.value;
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

  Future<Result<void>> _simutaleSearch() async {
    await Future.delayed(Duration(seconds: 5));
    print("Searching");
    return Result.ok(null);
  }

}
