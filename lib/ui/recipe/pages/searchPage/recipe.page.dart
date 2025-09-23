import 'package:chef_mate/ui/recipe/pages/searchPage/recipe.list.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/recipe.searchBar.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:chef_mate/ui/status.display.dart';
import 'package:flutter/material.dart';

class RecipesSearchPage extends StatelessWidget {
  final RecipeSearchPageViewModel _viewModel;

  const RecipesSearchPage({
    super.key,
    required RecipeSearchPageViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatusDisplay(
      command: _viewModel.load,
      loadingWidget: Center(child: CircularProgressIndicator()),
      errorWidget: Text("Error"),
      successWidget: Scaffold(
       
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: RecipesSearchBar(viewModel: _viewModel),
              ),
              ListenableBuilder(
                listenable: _viewModel,
                builder: (context, _) {
                  return StatusDisplay(
                    command: _viewModel.searchRecipes,
                    loadingWidget: Center(child: CircularProgressIndicator()),
                    errorWidget: Text("Error"),
                    successWidget: Expanded(
                      child: RecipeList(viewModel: _viewModel),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
