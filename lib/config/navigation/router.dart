import 'package:chef_mate/config/navigation/routes.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/recipe.filters.page.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/recipe.page.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

List<GoRoute> get _homeRoutes => [
  GoRoute(
      path: Routes.home,
      builder: (context, state) => RecipesSearchPage(viewModel: context.read<RecipeSearchPageViewModel>())
    ),
    GoRoute(
      path: Routes.filters,
      builder:(context, state) => RecipeFiltersPage(viewModel: context.read<RecipeSearchPageViewModel>())
    )
];

GoRouter router() => GoRouter(
  routes: [
    ..._homeRoutes
  ]
);