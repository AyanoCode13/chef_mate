import 'package:chef_mate/features/recipe/data/query/search.recipe.query.dart';
import 'package:chef_mate/features/recipe/presentation/notifiers/recipe.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadMoreButton extends StatefulWidget{
  @override
  State<LoadMoreButton> createState() => _LoadMoreButtonState();
}

class _LoadMoreButtonState extends State<LoadMoreButton> {
  int _offset = 10;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: () async {
        await context.read<RecipeNotifier>().searchRecipes.execute(arg: RecipeQuery(offset: _offset));
        setState(() {
          _offset+=10;
        });
      }, 
      child:Text("Load More")
    );
  }
}