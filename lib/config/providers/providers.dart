import 'package:chef_mate/features/recipe/data/repository/repository.dart';
import 'package:chef_mate/features/recipe/data/repository/repository.remote.dart';
import 'package:chef_mate/features/recipe/data/service/api.service.dart';
import 'package:chef_mate/features/recipe/domain/useCase/recipes.getAutocomplete.useCase.dart';
import 'package:chef_mate/features/recipe/domain/useCase/recipes.search.useCase.dart';
import 'package:chef_mate/features/recipe/domain/useCase/recipes.searchByIngredients.useCase.dart';
import 'package:chef_mate/features/recipe/ui/viewModels/recipe.search.page.viewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get recipeProviders => [
  Provider(create: (context) => RecipeApiService()),
  Provider(
    create: (context) =>
        RecipeApiRepository(apiService: context.read<RecipeApiService>()),
  ),
  Provider(
    create: (context) => SearchRecipesByIngredientsUseCase(
      repository: context.read<RecipeApiRepository>() as RecipeRepository,
    ),
  ),
  Provider(
    lazy: false,
    create: (context)=> SearchRecipesUseCase(
      recipeRepository: context.read<RecipeApiRepository>() as RecipeRepository
    )
  ),
  Provider(create: (context) => GetRecipesAutocompleteUseCase(recipeRepository: context.read<RecipeApiRepository>() as RecipeRepository)),
  ChangeNotifierProvider(
    create: (context) => 
    RecipeSearchPageViewModel(
      getRecipesAutocompleteUseCase:context.read<GetRecipesAutocompleteUseCase>(),
      searchRecipesByIngredientsUseCase: context.read<SearchRecipesByIngredientsUseCase>(),
      searchRecipesUseCase: context.read<SearchRecipesUseCase>()
    )
  )
];
