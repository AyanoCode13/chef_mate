import 'package:chaf_mate_2/ui/pages/home/components/searchBar.dart';
import 'package:chaf_mate_2/ui/pages/home/components/sections/cuisine.section.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: ListenableBuilder(
        listenable: context.read<RecipeViewModel>(),
        builder: (context, _) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HomeSearchBar(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CuisineSection(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
