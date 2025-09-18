import 'package:chef_mate/features/recipes/presentation/notifiers/recipe.notifier.dart';
import 'package:chef_mate/features/recipes/presentation/ui/recipesSearchPage/recipe.list.dart';
import 'package:chef_mate/features/recipes/presentation/ui/recipesSearchPage/searchBar.dart';
import 'package:chef_mate/features/recipes/presentation/ui/status.display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesSearchPage extends StatelessWidget {
  const RecipesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.watch<RecipeNotifier>().load;

    // TODO: implement build
    return Material(
      child: StatusDisplay(
        command: status,
        successWidget: Scaffold(
          appBar: AppBar(actions: [Flexible(child: RecipesSearchBar())]),
          body: SafeArea(
            child: ListenableBuilder(
              listenable: Listenable.merge([
                context.watch<RecipeNotifier>(),
                context.watch<RecipeNotifier>().searchRecipes,
              ]),
              builder: (context, _) {
                final search = context.watch<RecipeNotifier>().searchRecipes;
                return StatusDisplay(
                  command: search,
                  loadingWidget: Center(child: CircularProgressIndicator()),
                  errorWidget: Text("Error"),
                  successWidget: RecipeList(),
                );
              },
            ),
          ),
        ),
        loadingWidget: Center(child: CircularProgressIndicator()),
        errorWidget: Text("Error"),
      ),
    );
  }
}



