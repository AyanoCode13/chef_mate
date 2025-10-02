import 'package:chaf_mate_2/data/repository/recipe/recipe.api.repository.dart';
import 'package:chaf_mate_2/data/service/api/recipe.api.service.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.getAutocomplete.useCase.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.search.useCase.dart';
import 'package:chaf_mate_2/domain/useCases/recipe/recipes.searchByIngredients.useCase.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get recipeProviders => [
  Provider(create: (context) => RecipeApiService()),
  Provider(
    create: (context) =>
        RecipeApiRepository(recipeApiService: context.read<RecipeApiService>())
  ),
  Provider(
    create: (context) => SearchRecipesByIngredientsUseCase(
      repository: context.read<RecipeApiRepository>(),
    ),
  ),
  Provider(
    lazy: true,
    create: (context)=> SearchRecipesUseCase(
      recipeRepository: context.read<RecipeApiRepository>()
    )
  ),
  Provider(
    lazy: false,
    create: (context) => GetRecipesAutocompleteUseCase(recipeRepository: context.read<RecipeApiRepository>())),
 
  ChangeNotifierProvider(
    create: (context) => 
    RecipeViewModel(
      getRecipesAutocompleteUseCase:context.read<GetRecipesAutocompleteUseCase>(),
      searchRecipesByIngredientsUseCase: context.read<SearchRecipesByIngredientsUseCase>(),
      searchRecipesUseCase: context.read<SearchRecipesUseCase>()
    )
  )
];