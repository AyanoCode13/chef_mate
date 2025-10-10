import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/data/query/search.recipe.query.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.search.useCase.dart';
import 'package:chaf_mate_2/utils/command.dart';
import 'package:chaf_mate_2/utils/result.dart';
import 'package:flutter/material.dart';

abstract class _SearchRecipes extends ChangeNotifier{
  final SearchRecipesUseCase _searchRecipesUseCase;
  _SearchRecipes({required SearchRecipesUseCase searchRecipesUseCase})
    : _searchRecipesUseCase = searchRecipesUseCase;

  late List<RecipeApiModel> _results = [];
  List<RecipeApiModel> get results => _results;
  Future<Result<void>> search(RecipeQuery query) async {
    try{
      final res = await _searchRecipesUseCase.call(query: query);
    switch (res) {
      case Ok<List<RecipeApiModel>>():
        {
          _results = res.value;
          return Result.ok(null);
        }
      case Error<List<RecipeApiModel>>():
        {
          return Result.error(res.error);
        }
    }
    }finally{
      notifyListeners();
    }
  }
}

class GetVeganAndVegetarian extends _SearchRecipes{
  GetVeganAndVegetarian({required super.searchRecipesUseCase}) {
    call = ComplexCommand(search)..execute(arg: RecipeQuery(diet: "vegan|vegetarian", addRecipeInformation: true, number: 10));
  }
  late ComplexCommand<void, RecipeQuery> call;
}

class GetDrinks extends _SearchRecipes{
  GetDrinks({required super.searchRecipesUseCase}) {
    call = ComplexCommand(search)..execute(arg: RecipeQuery(type: "drink", addRecipeInformation: true, number: 10));
  }
  late ComplexCommand<void, RecipeQuery> call;
}

class GetAsian extends _SearchRecipes{
  GetAsian({required super.searchRecipesUseCase}) {
    call = ComplexCommand(search)..execute(arg: RecipeQuery(cuisine: "asian", addRecipeInformation: true, number: 10));
  }
  late ComplexCommand<void, RecipeQuery> call;
}

class GetAmerican extends _SearchRecipes{
  GetAmerican({required super.searchRecipesUseCase}) {
    call = ComplexCommand(search)..execute(arg: RecipeQuery(cuisine: "american", addRecipeInformation: true, number: 10));
  }
  late ComplexCommand<void, RecipeQuery> call;
}

