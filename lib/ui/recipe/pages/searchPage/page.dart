import 'package:chef_mate/ui/recipe/pages/searchPage/components/appbar.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/components/list.dart';
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
      successWidget: Material(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              HomePageAppBar(viewModel: _viewModel),
              SliverFillRemaining(
                child: RecipeList(viewModel: _viewModel),
              )
            ],
          ),
        ),
      ),
    );
  }
}
