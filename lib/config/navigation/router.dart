
import 'package:chef_mate/config/navigation/routes.dart';
import 'package:chef_mate/features/recipes/presentation/ui/recipes.search.page.dart';
import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => RecipesSearchPage()
    )
  ]
);