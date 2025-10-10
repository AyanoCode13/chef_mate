import 'package:cached_network_image/cached_network_image.dart';
import 'package:chaf_mate_2/config/routing/routes.dart';
import 'package:chaf_mate_2/data/models/recipe/recipeApiModel/recipe.api.model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeCard extends StatefulWidget {
  final RecipeApiModel _recipe;

  const RecipeCard({super.key, required RecipeApiModel recipe})
    : _recipe = recipe;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => Icon(Icons.error),
        placeholder: (context, url) => CircularProgressIndicator(),
        imageUrl: widget._recipe.image,
        imageBuilder: (context, imageProvider) => GestureDetector(
          onTap: () {
            context.push(Routes.recipe(widget._recipe.id.toString()));
          },
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                opacity: 0.9,
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          widget._recipe.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ImageIcon(
                        widget._recipe.vegan
                            ? AssetImage("assets/icons/vegan.png")
                            : null,
                        color: Colors.green[900],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ImageIcon(
                        widget._recipe.vegetarian
                            ? AssetImage("assets/icons/vegetarian.png")
                            : null,
                        color: Colors.green[500],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 5.0,
                    children: [
                      Icon(Icons.timer, color: Colors.white54),
                      Text(
                        widget._recipe.readyInMinutes.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      Spacer(),
                      ImageIcon(
                        widget._recipe.glutenFree
                            ? AssetImage("assets/icons/glutenFree.png")
                            : null,
                        color: Colors.white70,
                      ),
                      ImageIcon(
                        widget._recipe.dairyFree
                            ? AssetImage("assets/icons/dairyFree.png")
                            : null,
                        color: Colors.white70,
                      ),

                      Spacer(),
                      Icon(Icons.restaurant, color: Colors.white54),
                      Text(
                        widget._recipe.servings.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
