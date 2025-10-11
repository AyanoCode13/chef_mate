import 'package:chaf_mate_2/data/repository/recipe/recipe.api.repository.dart';
import 'package:chaf_mate_2/data/service/api/recipe.api.service.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.getById.useCase.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.search.useCase.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:chaf_mate_2/ui/viewModels/recipe.viewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get recipeProviders {
  final apiService = RecipeApiService();
  final recipeRepository = RecipeApiRepository(recipeApiService: apiService);
  final searchRecipesUseCase = SearchRecipesUseCase(recipeRepository: recipeRepository);
  final getRecipeByIdUseCase = GetRecipeByIdUseCase(recipeApiRepository: recipeRepository);
  return [
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => GetVeganAndVegetarian(
        searchRecipesUseCase: searchRecipesUseCase,
      ),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) =>
          GetDrinks(searchRecipesUseCase: searchRecipesUseCase),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) =>
          GetAsian(searchRecipesUseCase: searchRecipesUseCase),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => GetAmerican(
        searchRecipesUseCase: searchRecipesUseCase,
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => RecipeViewModel(
        getRecipeByIdUseCase: getRecipeByIdUseCase,
      ),
    ),
  ];
}
