import 'package:chef_mate/features/recipes/presentation/notifiers/recipe.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = context.watch<RecipeNotifier>().recipes;
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Card(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(recipes.elementAt(index).title),
          ));
        },
      ),
    );
  }
}