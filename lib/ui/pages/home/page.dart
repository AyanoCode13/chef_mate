import 'package:chaf_mate_2/ui/status.display.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: StatusDisplay(
        command: context.read<RecipeViewModel>().load, 
        successWidget: ListenableBuilder(
          listenable: context.read<RecipeViewModel>(), 
          builder: (context, _){
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text("Home"),
                  ),
                  SliverList.builder(
                    itemCount: context.watch<RecipeViewModel>().recipes.length,
                    itemBuilder: (context, index){
                      final recipe = context.watch<RecipeViewModel>().recipes.elementAt(index);
                      return Text(recipe.title);
                    }
                  )
                ],
              ),
            );
          }
        )
      ),
    );
  }
}