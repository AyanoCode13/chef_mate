import 'package:chef_mate/config/navigation/routes.dart';
import 'package:chef_mate/ui/home/page.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/page.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

List<GoRoute> get _homeRoutes => [
  GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(),
    )
];

GoRouter router() => GoRouter(
  routes: [
    ..._homeRoutes
  ]
);