import 'package:chef_mate/ui/recipe/pages/searchPage/recipe.page.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => RecipesSearchPage(viewModel: context.read<RecipeSearchPageViewModel>())
    ),
    
  ]
);