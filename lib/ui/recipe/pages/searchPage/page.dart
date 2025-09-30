import 'package:chef_mate/ui/recipe/pages/searchPage/components/appbar.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/components/list.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:chef_mate/ui/splash.screen.dart';
import 'package:chef_mate/ui/status.display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesSearchPage extends StatelessWidget {
  const RecipesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RecipeSearchPageViewModel>();
    // TODO: implement build
    return Material(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomePageAppBar(viewModel: viewModel),
            SliverFillRemaining(child: RecipeList(viewModel: viewModel)),
          ],
        ),
      ),
    );
  }
}
