import 'package:cached_network_image/cached_network_image.dart';
import 'package:chaf_mate_2/ui/viewModels/recipe.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Card(
            child: CachedNetworkImage(
              imageUrl: context.watch<RecipeViewModel>().recipe.image,
              errorWidget: (context, url, error) => Center(child: Text('Error')),
              placeholder: (context, url) => Center(child: Text("Loading")),
              imageBuilder: (context, imageProvider) => Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text("Image"),
                )
              ,
            ),
          ),
        )
      ],
    );
  }
}
