import 'package:chaf_mate_2/config/routing/routes.dart';
import 'package:chaf_mate_2/ui/pages/home/page.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> get _recipeRoutes => [
  GoRoute(
    path: Routes.home,
    builder: (context, state) => HomePage()
  )
];

GoRouter router() => GoRouter(
  routes: [..._recipeRoutes]
);