import 'package:chef_mate/features/recipe/domain/entity/recipe_summary/recipe.summary.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final RecipeSummary _recipe;

  const RecipeCard({super.key, required RecipeSummary recipe})
    : _recipe = recipe;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.9),
              BlendMode.modulate,
            ),
            fit: BoxFit.cover,
            image: NetworkImage(_recipe.imageUrl),
          ),
        ),
        child: Text(
          _recipe.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
