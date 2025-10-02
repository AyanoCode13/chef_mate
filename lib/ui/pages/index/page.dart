import 'package:chaf_mate_2/ui/pages/home/page.dart';
import 'package:chaf_mate_2/ui/splash.screen.dart';
import 'package:chaf_mate_2/ui/status.display.dart';
import 'package:chaf_mate_2/ui/viewModels/home.viewModel.dart';
import 'package:chaf_mate_2/utils/command.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<Widget> _destinations = [
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.kitchen), label: "Storage"),
    NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites"),
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined),
      label: "Planner",
    ),
    NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
  ];
  final List<Widget> _pages = [HomePage(), Text("Storegae"),Text("Fav"),Text("Planner"),Text("Settings")];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatusDisplay(
      command: context.read<RecipeViewModel>().load,
      loadingWidget: SplashScreen(),
      successWidget: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          destinations: _destinations,
          onDestinationSelected: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
        body: _pages.elementAt(_currentIndex),
      ),
    );
  }
}
