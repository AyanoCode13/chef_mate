import 'package:chef_mate/features/recipe/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipe/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:chef_mate/features/recipe/domain/useCase/recipes.getAutocomplete.useCase.dart';
import 'package:chef_mate/features/recipe/domain/useCase/recipes.search.useCase.dart';
import 'package:chef_mate/features/recipe/domain/useCase/recipes.searchByIngredients.useCase.dart';
import 'package:chef_mate/utils/command.dart';
import 'package:chef_mate/utils/result.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class RecipeSearchPageViewModel extends ChangeNotifier {
  final SearchRecipesByIngredientsUseCase _searchRecipesByIngredientsUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;
  final GetRecipesAutocompleteUseCase _getRecipesAutocompleteUseCase;
  RecipeSearchPageViewModel({
    required GetRecipesAutocompleteUseCase getRecipesAutocompleteUseCase,
    required SearchRecipesByIngredientsUseCase
    searchRecipesByIngredientsUseCase,
    required SearchRecipesUseCase searchRecipesUseCase,
  }) : _getRecipesAutocompleteUseCase = getRecipesAutocompleteUseCase,
       _searchRecipesByIngredientsUseCase = searchRecipesByIngredientsUseCase,
       _searchRecipesUseCase = searchRecipesUseCase {
    searchByIngredientsCommand = ComplexCommand(_searchByIngredients);
    load = ComplexCommand(_searchRecipes)..execute(arg: RecipeQuery( number: 30, offset: 0));
    loadMore = ComplexCommand(_loadMore);
    searchRecipes = ComplexCommand(_searchRecipes);
    getAutocomplete = ComplexCommand(_getAutoComplete);
    simulateSearch = BasicCommand(_simutaleSearch);
  }

  late final ComplexCommand<void, List<String>> searchByIngredientsCommand;
  late final ComplexCommand<void, RecipeQuery> load;
  late final ComplexCommand<void, int> loadMore;
  late final ComplexCommand<void, RecipeQuery> searchRecipes;
  late final ComplexCommand<void, String> getAutocomplete;
  late final BasicCommand simulateSearch;

  late RecipeQuery _query = RecipeQuery();

  final Logger _logger = Logger();

  late List<RecipeSummary> _recipes = [];
  List<RecipeSummary> get recipes => _recipes;

  late List<String> _suggestions = [];
  List<String> get suggestions => _suggestions;

  Future<Result<void>> _searchRecipes(RecipeQuery query) async {
    _query = query;
    _logger.i(_query.toQueryParameters());

    try {
      final res = await _searchRecipesUseCase.call(query: _query);
      switch (res) {
        case Ok<List<RecipeSummary>>():
          {
            _recipes.addAll(res.value);

            return Result.ok(null);
          }
        case Error<List<RecipeSummary>>():
          {
            return Result.error(res.error);
          }
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _searchByIngredients(List<String> ingredients) async {
    try {
      final Result<List<RecipeSummary>> res =
          await _searchRecipesByIngredientsUseCase(ingredients: ingredients);
      switch (res) {
        case Ok<List<RecipeSummary>>():
          {
            _recipes = res.value;
            return Result.ok(_recipes);
          }
        case Error<List<RecipeSummary>>():
          {
            return Result.error(res.error);
          }
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _getAutoComplete(String query) async {
    try {
      final res = await _getRecipesAutocompleteUseCase.call(query: query);
      switch (res) {
        case Ok<List<String>>():
          {
            _suggestions = res.value;
            _logger.i(_suggestions);
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

  Future<Result<void>> _loadMore(int offset) async {
    _query = _query.merge(RecipeQuery(offset: offset));
    _logger.i(_query.toQueryParameters());
    return await _searchRecipes(_query);
  }

  Future<Result<void>> _simutaleSearch() async {
    await Future.delayed(Duration(seconds: 5));
    print("Searching");
    return Result.ok(null);
  }
}
