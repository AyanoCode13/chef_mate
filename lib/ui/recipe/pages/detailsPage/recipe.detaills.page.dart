import 'package:chef_mate/ui/recipe/pages/searchPage/detailsPage/recipe.video.dart';
import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            Flexible(child: RecipeVideo(videoUrl: "https://www.youtube.com/watch?v=Jxw6FaA0j3I"))
          ],
        ) 
      ),
    );
  }
  
}