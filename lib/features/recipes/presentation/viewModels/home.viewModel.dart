import 'package:chef_mate/features/recipes/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/features/recipes/domain/useCase/search.recipes.useCase.dart';
import 'package:chef_mate/utils/command.dart';
import 'package:chef_mate/utils/result.dart';
import 'package:flutter/material.dart';

class  HomeViewModel extends ChangeNotifier {
  final SearchRecipesByIngredientsUseCase _searchRecipesByIngredientsUseCase;
  HomeViewModel({required SearchRecipesByIngredientsUseCase searchRecipesByIngredientsUseCase}) : _searchRecipesByIngredientsUseCase = searchRecipesByIngredientsUseCase {
    searchByIngredientsCommand = ComplexCommand(_searchByIngredients);
  }

  late final ComplexCommand<void,List<String>> searchByIngredientsCommand;
  late List<RecipeSummary> _recipes;
  List<RecipeSummary> get recipes => _recipes;

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

}