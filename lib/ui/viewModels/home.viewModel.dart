import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/data/query/search.recipe.query.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.getAutocomplete.useCase.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.search.useCase.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.searchByIngredients.useCase.dart';
import 'package:chaf_mate_2/utils/command.dart';
import 'package:chaf_mate_2/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RecipeViewModel extends ChangeNotifier {
  final SearchRecipesByIngredientsUseCase _searchRecipesByIngredientsUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;
  final GetRecipesAutocompleteUseCase _getRecipesAutocompleteUseCase;
  RecipeViewModel({
    required GetRecipesAutocompleteUseCase getRecipesAutocompleteUseCase,
    required SearchRecipesByIngredientsUseCase
    searchRecipesByIngredientsUseCase,
    required SearchRecipesUseCase searchRecipesUseCase,
  }) : _getRecipesAutocompleteUseCase = getRecipesAutocompleteUseCase,
       _searchRecipesByIngredientsUseCase = searchRecipesByIngredientsUseCase,
       _searchRecipesUseCase = searchRecipesUseCase {
    load = ComplexCommand(_searchRecipes)
      ..execute(arg: RecipeQuery());

    searchRecipes = ComplexCommand(_searchRecipes);
    getAutocomplete = ComplexCommand(_getAutocomplete);
  }

  late final ComplexCommand<void, List<String>> searchByIngredientsCommand;
  late final ComplexCommand<void, RecipeQuery> load;
  late final ComplexCommand<void, int> loadMore;
  late final ComplexCommand<void, RecipeQuery> searchRecipes;
  late final ComplexCommand<void, String> getAutocomplete;
  late final BasicCommand simulateSearch;

  late List<RecipeApiModel> _recipes = [];
  List<RecipeApiModel> get recipes => _recipes;

  late List<String> _suggestions = [];
  List<String> get suggestions => _suggestions;
  
  final Logger _logger = Logger();
  Future<Result<void>> _searchRecipes(RecipeQuery query) async {
    await Future.delayed(Duration(seconds: 3));
    try {
      final res = await _searchRecipesUseCase.call(query: query);
      switch (res) {
        case Ok<List<RecipeApiModel>>():
          {
            _recipes = res.value;

            return Result.ok(null);
          }
        case Error<List<RecipeApiModel>>():
          {
            return Result.error(res.error);
          }
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _getAutocomplete(String query) async {
    try {
      final res = await _getRecipesAutocompleteUseCase.call(arg: query);
      switch (res) {
        case Ok<List<String>>():
          {
            _logger.i(res.value);
            _suggestions = res.value;

            return Result.ok(null);
          }
        case Error<List<String>>():
          {
            return Result.error(res.error);
          }
      }
    } finally {
      notifyListeners();
    }
  }
}
