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
              Flexible(child: _SearchButton())
              
            ],
          ),
          body: ListenableBuilder(
            listenable: context.watch<RecipeNotifier>(),
            builder: (context, _) {
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
    );
  }
}

class _SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final searchRecipes = context.read<RecipeNotifier>().searchRecipes;
    final recipes = context.watch<RecipeNotifier>().recipes;
    return SearchAnchor.bar(
      
      onChanged: (value) async{
        await searchRecipes.execute(arg: RecipeQuery(titleMatch: value));
        print(recipes);
      },
      suggestionsBuilder: (context, controller) async {
        await searchRecipes.execute(arg: RecipeQuery(titleMatch: controller.text));
        print(recipes); 
     
      return recipes.map((recipe)=> ListTile(
        title: Text(recipe.title),
        
      ));
    });
  }
}
