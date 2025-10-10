import 'package:chaf_mate_2/ui/pages/home/components/cards/recipe.card.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmericanList extends StatelessWidget {
  const AmericanList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: context.watch<GetAmerican>().results.length,
        itemBuilder: (context, index) {
          final recipe = context.watch<GetAmerican>().results.elementAt(index);
          return RecipeCard(recipe: recipe);
        },
      ),
    );
  }
}
