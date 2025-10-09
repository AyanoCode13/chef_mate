import 'package:chaf_mate_2/config/routing/routes.dart';
import 'package:chaf_mate_2/ui/pages/index/page.dart';
import 'package:chaf_mate_2/ui/pages/recipe/page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> get _recipeRoutes => [
  GoRoute(
    path: Routes.index,
    builder: (context, state) {
      return IndexPage();
    },
  ),
  GoRoute(
    path: "/recipes/:id",
    builder: (context, state) {
      return Recipe();
    },
  ),
];

GoRouter router() => GoRouter(routes: [..._recipeRoutes]);
