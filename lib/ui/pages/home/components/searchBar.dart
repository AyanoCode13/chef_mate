import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SearchBar(
      elevation: WidgetStatePropertyAll(10),
      hintText: "Search Recipes",
      leading: ImageIcon(size: 30, AssetImage("assets/icons/search.png")),
      trailing: [
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_alt)),
      ],
    );
  }
}
