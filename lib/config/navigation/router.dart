
import 'package:chef_mate/features/recipe/presentation/ui/recipeDetails/recipe.detaills.page.dart';
import 'package:chef_mate/features/recipe/presentation/ui/searchPage/recipe.page.dart';
import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => RecipesSearchPage()
    ),
    GoRoute(
      path: "/:id",
      builder: (context, state) => RecipeDetailsPage()
    )
  ]
);