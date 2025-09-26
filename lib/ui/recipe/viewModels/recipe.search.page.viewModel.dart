import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/domain/entity/recipe/recipeSummary/recipe.summary.dart';
import 'package:chef_mate/domain/useCase/recipe/recipes.getAutocomplete.useCase.dart';
import 'package:chef_mate/domain/useCase/recipe/recipes.search.useCase.dart';
import 'package:chef_mate/domain/useCase/recipe/recipes.searchByIngredients.useCase.dart';
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
    
    load = ComplexCommand(_searchRecipes)..execute(arg: RecipeQuery(offset: 0, number: 30));
    loadMore = ComplexCommand(_loadMore);
    searchRecipes = ComplexCommand(_searchRecipes);
    simulateSearch = BasicCommand(_simutaleSearch);
  }

  late final ComplexCommand<void, List<String>> searchByIngredientsCommand;
  late final ComplexCommand<void, RecipeQuery> load;
  late final ComplexCommand<void, int> loadMore;
  late final ComplexCommand<void, RecipeQuery> searchRecipes;
  late final ComplexCommand<void, String> getAutocomplete;
  late final BasicCommand simulateSearch;

  late RecipeQuery _query = RecipeQuery(offset: 0, number: 30);

  final Logger _logger = Logger();

  late List<RecipeSummary> _recipes = [];
  List<RecipeSummary> get recipes => _recipes;

  late List<String> _suggestions = [];
  List<String> get suggestions => _suggestions;

  Future<Result<void>> _searchRecipes(RecipeQuery query) async {
    try {
      final res = await _searchRecipesUseCase.call(query: query);
      switch (res) {
        case Ok<List<RecipeSummary>>():
          {
            _logger.i(res.value);
            _recipes = res.value;

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
