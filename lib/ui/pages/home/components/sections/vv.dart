import 'package:chaf_mate_2/ui/pages/home/components/lists/vv.dart';
import 'package:flutter/material.dart';

class VeganAndVegetarianSection extends StatelessWidget {
  const VeganAndVegetarianSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                spacing: 5.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Vegan and Vegetarian",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ImageIcon(
                    AssetImage("assets/icons/vegan.png"),
                    color: Colors.green[800],
                    size: 36,
                  ),
                  ImageIcon(
                    AssetImage("assets/icons/vegan.png"),
                    color: Colors.green[300],
                    size: 36,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(children: [Expanded(child: VeganAndVegetarianList())]),
      ],
    );
  }
}
