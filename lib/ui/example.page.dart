import 'package:chef_mate/domain/useCase/recipe/recipes.search.useCase.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  final RecipeSearchPageViewModel _viewModel;

  const ExamplePage({super.key, required RecipeSearchPageViewModel viewModel}) : _viewModel = viewModel;
  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Center(
        child: Text("Example"),
      ),
    );
  }
}