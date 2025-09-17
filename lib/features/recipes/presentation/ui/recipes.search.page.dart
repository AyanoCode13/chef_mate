import 'dart:async';

import 'package:chef_mate/features/recipes/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipes/presentation/notifiers/recipe.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipesSearchPage extends StatelessWidget {
  const RecipesSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.watch<RecipeNotifier>().load;
    
    // TODO: implement build
    return Material(
      child: ListenableBuilder(
        listenable: status,
        builder: (context, child) {
          if (status.running) {
            return Center(child: CircularProgressIndicator());
          }
          if (status.failed) {
            return Center(child: Text("Error"));
          }
          return child!;
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Flexible(child: _SearchBar())
              
            ],
          ),
          body: SafeArea(
            child: ListenableBuilder(
              listenable: Listenable.merge([
                context.watch<RecipeNotifier>(),
                context.watch<RecipeNotifier>().simulateSearch
              ]),
              builder: (context, _) {
                final search = context.watch<RecipeNotifier>().simulateSearch;
                if(search.running){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final recipes = context.watch<RecipeNotifier>().recipes;
                return GridView.builder(
                  itemCount: recipes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Card(child: Text(recipes.elementAt(index).title));
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


class _SearchBar extends StatefulWidget {
  const _SearchBar({
    super.key 
  });

  @override
  State<_SearchBar> createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
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
    _debounceTimer = Timer(delay, () {
      // Execute search when timer completes
      if (_controller.text.isNotEmpty) {
       context.read<RecipeNotifier>().simulateSearch.execute();
      }
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
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
