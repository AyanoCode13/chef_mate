import 'package:chef_mate/ui/recipe/pages/searchPage/page.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:chef_mate/ui/splash.screen.dart';
import 'package:chef_mate/ui/status.display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomePage(), RecipesSearchPage(), Text("Settings")];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatusDisplay(
      command: context.read<RecipeSearchPageViewModel>().load,
      loadingWidget: SplashScreen(),
      successWidget: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.search), label: "Search"),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
        body: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
