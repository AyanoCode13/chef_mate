import 'package:cached_network_image/cached_network_image.dart';
import 'package:chaf_mate_2/ui/status.display.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsList extends StatelessWidget {
  
  const MealsList({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatusDisplay(
      command: context.read<GetDrinks>().call,
      successWidget: SizedBox(
        width: 250,
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: context.watch<GetDrinks>().results.length,
          itemBuilder: (context, index) {
            final recipe = context
                .watch<GetDrinks>()
                .results
                .elementAt(index);
            return Card(
              child: CachedNetworkImage(
                imageUrl: recipe.image,
                imageBuilder: (context, imageProvider) => Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      opacity: 0.9,
                      colorFilter: ColorFilter.mode(
                        Colors.black38,
                        BlendMode.darken,
                      ),
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
                                recipe.title,
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
                              recipe.vegan
                                  ? AssetImage("assets/icons/vegan.png")
                                  : null,
                              color: Colors.green[900],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ImageIcon(
                              recipe.vegetarian
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
                              recipe.readyInMinutes.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                            Spacer(),
                            ImageIcon(
                              recipe.glutenFree
                                  ? AssetImage("assets/icons/glutenFree.png")
                                  : null,
                              color: Colors.white70,
                            ),
                            ImageIcon(
                              recipe.dairyFree
                                  ? AssetImage("assets/icons/dairyFree.png")
                                  : null,
                              color: Colors.white70,
                            ),

                            Spacer(),
                            Icon(Icons.restaurant, color: Colors.white54),
                            Text(
                              recipe.servings.toString(),
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
            );
          },
        ),
      ),
    );
  }
  
}