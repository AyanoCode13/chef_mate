import 'dart:async';
import 'package:chef_mate/features/recipe/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipe/presentation/notifiers/recipe.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesSearchBar extends StatefulWidget {
  const RecipesSearchBar({super.key});

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
         await context.read<RecipeNotifier>().searchRecipes.execute(
          arg: RecipeQuery(titleMatch: value),
        );
      },
      controller: _controller,
      leading: Icon(Icons.search),
      hintText: "Search...",
    );
  }
}
