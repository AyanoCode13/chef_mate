
import 'package:chaf_mate_2/ui/pages/home/components/lists/asian.dart';
import 'package:flutter/material.dart';

class AsianSection extends StatelessWidget {
  const AsianSection({super.key});

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
                  "Asian",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: AsianList()),
          ],
        )
       
      ],
    );
  }
}
