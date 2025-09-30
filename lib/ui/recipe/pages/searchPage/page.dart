import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/data/service/api/recipe.api.service.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/components/filters.dart';
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
    return StatusDisplay(
      command: viewModel.load,
      loadingWidget: Center(child: CircularProgressIndicator()),
      errorWidget: Text("Error"),
      successWidget: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      RecipeFiltersDialogue(),
                );
              },
              icon: Icon(Icons.filter_list),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: AppBarSearchDelegate(viewModel: viewModel),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  return StatusDisplay(
                    command: viewModel.searchRecipes,
                    successWidget: Expanded(
                      child: RecipeList(viewModel: viewModel),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarSearchDelegate extends SearchDelegate {
  final RecipeSearchPageViewModel _viewModel;
  
  AppBarSearchDelegate({required RecipeSearchPageViewModel viewModel})
    : _viewModel = viewModel, super();
    
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   
    close(context, null);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _viewModel.getAutocomplete.execute(arg: query);
    return ListView.builder(
      itemCount: _viewModel.suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = _viewModel.suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            _viewModel.searchRecipes.execute(arg: RecipeQuery(query: query, offset: 0, number: 30));
            close(context, null);
          },
        );
      },
    );
  }
}
