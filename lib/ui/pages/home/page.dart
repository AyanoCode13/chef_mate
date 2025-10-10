import 'package:chaf_mate_2/ui/pages/home/components/sections/american.dart';
import 'package:chaf_mate_2/ui/pages/home/components/sections/asian.dart';
import 'package:chaf_mate_2/ui/pages/home/components/sections/drinks.dart';
import 'package:chaf_mate_2/ui/pages/home/components/sections/vv.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: AmericanSection()),
            SliverToBoxAdapter(child: AsianSection()),
            SliverToBoxAdapter(child: MealSection()),
            SliverToBoxAdapter(child: VeganAndVegetarianSection()),
          ],
        ),
      ),
    );
  }
}
