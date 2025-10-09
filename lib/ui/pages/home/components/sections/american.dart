
import 'package:chaf_mate_2/ui/pages/home/components/lists/american.dart';
import 'package:flutter/material.dart';

class AmericanSection extends StatelessWidget {
  const AmericanSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "American",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: AmericanList()),
          ],
        )
       
      ],
    );
  }
}
