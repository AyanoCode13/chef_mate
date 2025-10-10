import 'package:chaf_mate_2/config/routing/routes.dart';
import 'package:chaf_mate_2/ui/pages/index/page.dart';
import 'package:chaf_mate_2/ui/pages/recipe/page.dart';
import 'package:chaf_mate_2/ui/status.display.dart';
import 'package:chaf_mate_2/ui/viewModels/recipe.viewModel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

List<GoRoute> get _recipeRoutes => [
  GoRoute(
    path: Routes.index,
    builder: (context, state) {
      return IndexPage();
    },
  ),
  GoRoute(
    path: "/recipe/:id",
    builder: (context, state) {
      context.read<RecipeViewModel>().load.execute(
        arg: int.parse(state.pathParameters["id"]!),
      );
      return StatusDisplay(
        command: context.read<RecipeViewModel>().load,
        successWidget: Recipe(),
      );
    },
  ),
];

GoRouter router() => GoRouter(routes: [..._recipeRoutes]);
