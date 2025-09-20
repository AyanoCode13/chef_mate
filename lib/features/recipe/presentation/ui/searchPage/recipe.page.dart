import 'package:chef_mate/features/recipe/presentation/notifiers/recipe.notifier.dart';
import 'package:chef_mate/features/recipe/presentation/ui/searchPage/recipe.buttom.loadMore.dart';
import 'package:chef_mate/features/recipe/presentation/ui/searchPage/recipe.fab.dart';
import 'package:chef_mate/features/recipe/presentation/ui/searchPage/recipe.list.dart';
import 'package:chef_mate/features/recipe/presentation/ui/searchPage/recipe.searchBar.dart';
import 'package:chef_mate/features/recipe/presentation/ui/status.display.dart';
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
        loadingWidget: Center(child: CircularProgressIndicator()),
        errorWidget: Text("Error"),
        successWidget: Scaffold(
          appBar: AppBar(actions: [Flexible(child: RecipesSearchBar())]),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  
                  child: ListenableBuilder(
                    listenable: context.watch<RecipeNotifier>(),
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
                LoadMoreButton()
              ],
            ),
          ),
          floatingActionButton: RecipesFab(),
        ),
      ),
    );
  }
}



