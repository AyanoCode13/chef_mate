import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.getById.useCase.dart';
import 'package:chaf_mate_2/utils/command.dart';
import 'package:chaf_mate_2/utils/result.dart';
import 'package:flutter/material.dart';

final class RecipeViewModel extends ChangeNotifier {
    final GetRecipeByIdUseCase _getRecipeByIdUseCase;
  RecipeViewModel({required GetRecipeByIdUseCase getRecipeByIdUseCase}) : _getRecipeByIdUseCase = getRecipeByIdUseCase{
    load = ComplexCommand(_load);
  }

  late RecipeApiModel _recipe;
  RecipeApiModel get recipe => _recipe;
  late ComplexCommand<void,int> load;

  
  Future<Result<void>> _load(int id) async {
    try{
      final res = await _getRecipeByIdUseCase.call(arg: id);
    switch (res) {
      case Ok<RecipeApiModel>():
        {
          _recipe = res.value;
          return Result.ok(null);
        }
      case Error<RecipeApiModel>():
        {
          return Result.error(res.error);
        }
    }
    }finally{
      notifyListeners();
    }
  }
}