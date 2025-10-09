import 'package:chaf_mate_2/ui/pages/home/components/lists/drinks.dart';
import 'package:flutter/material.dart';

class MealSection extends StatelessWidget {
  const MealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Drinks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(children: [Expanded(child: MealsList())]),
      ],
    );
  }
}
