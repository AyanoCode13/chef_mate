import 'package:flutter/material.dart';

class RecipeCuisines extends StatelessWidget {
  RecipeCuisines({super.key});
  final List<Map<String, dynamic>> _cuisines = [
    {"name": "Italian", "image": "assets/recipes/categories/italian.jpg"},
    {"name": "Chinese", "image": "assets/recipes/categories/chinese.jpg"},
    {"name": "Mexican", "image": "assets/recipes/categories/mexican.jpg"},
    {"name": "Indian", "image": "assets/recipes/categories/indian.jpg"},
    {"name": "French", "image": "assets/recipes/categories/french.jpg"},
    {"name": "Japanese", "image": "assets/recipes/categories/japanese.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate card width: (screenWidth - paddings) / 2.5
        final screenWidth = constraints.maxWidth;
        final horizontalPadding = 16.0;
        final cardSpacing = 12.0;
        final availableWidth = screenWidth - (horizontalPadding * 2);
        final itemCount = _cuisines.length;
        double cardWidth = availableWidth;
        bool enableScrolling = false;

        // Width for 2.5 cards: divide by 2.5

        if (itemCount >= 2) {
          // Show 2 full cards
          cardWidth = (availableWidth - cardSpacing) / (itemCount * 0.4);
          enableScrolling = true;
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            physics: enableScrolling
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            itemCount: _cuisines.length,
            itemBuilder: (context, index) {
              final cuisine = _cuisines.elementAt(index);
              return GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  width: cardWidth,
                  padding: EdgeInsets.only(
                    right: index == itemCount - 1 ? 0 : cardSpacing,
                  ),
                  margin: EdgeInsets.only(right: cardSpacing),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withAlpha(30),
                          Colors.black.withAlpha(70),
                        ],
                      ),
                    ),
                  )
                ),
              );
            },
          ),
        );
      },
    );
  }
}