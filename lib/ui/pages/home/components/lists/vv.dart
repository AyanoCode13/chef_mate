import 'package:chaf_mate_2/ui/pages/home/components/cards/recipe.card.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VeganAndVegetarianList extends StatelessWidget {
  const VeganAndVegetarianList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        width: 250,
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: context.watch<GetVeganAndVegetarian>().results.length,
          itemBuilder: (context, index) {
            final recipe = context
                .watch<GetVeganAndVegetarian>()
                .results
                .elementAt(index);
            return RecipeCard(recipe: recipe);
          },
        ),
      );
  }
}
