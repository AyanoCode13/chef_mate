import 'dart:async';
import 'package:chef_mate/features/recipes/presentation/notifiers/recipe.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesSearchBar extends StatefulWidget {
  const RecipesSearchBar({super.key});

  @override
  State<RecipesSearchBar> createState() => _RecipesSearchBarState();
}

class _RecipesSearchBarState extends State<RecipesSearchBar> {
  final SearchController _controller = SearchController();
  List<String> _suggestions = ["beef burger", "beef salad"];
  Timer? _debounceTimer;
  final Duration delay = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _controller.text;

    // Cancel the previous timer
    _debounceTimer?.cancel();

    // Start a new timer
    _debounceTimer = Timer(delay, () async {
      // Check if widget is still mounted before using context
      if (!mounted) return;

      // Execute search when timer completes
       await context.read<RecipeNotifier>().getAutocomplete.execute(
          arg: _controller.text,
        );
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
    final suggestions = context.watch<RecipeNotifier>().suggestions;
    return SearchAnchor.bar(
         
          barLeading: Icon(Icons.search),
          barHintText: "Search...",
          searchController: _controller,
          suggestionsBuilder: (context, controller) {
            // Use the notifier from the Consumer scope

            return suggestions.map(
              (suggestion) => ListTile(
                title: Text(suggestion),
                onTap: () {
                  controller.closeView(suggestion);
                  // Handle suggestion selection here if needed
                },
              ),
            );
          },
        );
  }
}
