import 'dart:async';
import 'dart:ui';

import 'package:chef_mate/config/navigation/routes.dart';
import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/ui/recipe/pages/searchPage/recipe.filters.dialog.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipesSearchBar extends StatefulWidget {
  final RecipeSearchPageViewModel _viewModel;

  const RecipesSearchBar({super.key, required RecipeSearchPageViewModel viewModel}) : _viewModel = viewModel;
 

  @override
  State<RecipesSearchBar> createState() => _RecipesSearchBarState();
}

class _RecipesSearchBarState extends State<RecipesSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;
  final Duration delay = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    
    // Cancel the previous timer
    _debounceTimer?.cancel();

    // Start a new timer
    _debounceTimer = Timer(delay, () async {
      // Check if widget is still mounted before using context
      if (!mounted) return;

      // Execute search when timer completes
      
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SearchBar(
      onSubmitted: (value) async {
         await widget._viewModel.searchRecipes.execute(
          arg: RecipeQuery(titleMatch: value),
        );
        _controller.clear();
      },
      trailing: [
        IconButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return RecipeFiltersDialogue(viewModel: widget._viewModel);
          });
        }, icon: Icon(Icons.filter_alt))
      ],
      constraints: BoxConstraints(maxHeight: 100),
      controller: _controller,
      leading: Icon(Icons.search),
      hintText: "Search...",
    );
  }
}
