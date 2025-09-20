import 'package:chef_mate/features/recipe/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipe/presentation/notifiers/recipe.notifier.dart';
import 'package:chef_mate/features/recipe/presentation/ui/searchPage/recipe.card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final ScrollController _scrollController = ScrollController();
  int _offset = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
    
  }
  Future<void> _scrollListener() async {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      setState(() {
        _offset +=10;  
      }); // Trigger 200px before bottom
      await context.read<RecipeNotifier>().searchRecipes.execute(arg: RecipeQuery(offset: _offset));
    }
  }


  @override
  Widget build(BuildContext context) {
    final recipes = context.watch<RecipeNotifier>().recipes;
    
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        controller: _scrollController,
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes.elementAt(index);
          return RecipeCard(recipe: recipe);
        },
      ),
    );
  }
}