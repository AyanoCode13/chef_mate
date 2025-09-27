import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/components/filters.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final RecipeSearchPageViewModel _viewModel;

  const HomePageAppBar({
    super.key,
    required RecipeSearchPageViewModel viewModel,
  }) : _viewModel = viewModel;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Home"),
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) =>
                  RecipeFiltersDialogue(viewModel: _viewModel),
            );
          },
          icon: Icon(Icons.filter_list),
        ),
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: _AppBarSearchDelegate(viewModel: _viewModel),
            );
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}

class _AppBarSearchDelegate extends SearchDelegate {
  final RecipeSearchPageViewModel _viewModel;

  _AppBarSearchDelegate({required RecipeSearchPageViewModel viewModel})
    : _viewModel = viewModel,
      super();

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
      itemCount: context.watch<RecipeSearchPageViewModel>().suggestions.length,
      itemBuilder: (context, index) {
        final suggestion =
            context.watch<RecipeSearchPageViewModel>().suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            _viewModel.searchRecipes.execute(
              arg: RecipeQuery(query: query, offset: 0, number: 30),
            );
            close(context, null);
          },
        );
      },
    );
  }
}