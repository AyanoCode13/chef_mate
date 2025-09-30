import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecipeFiltersDialogue extends StatefulWidget {
  const RecipeFiltersDialogue({super.key});

 
  @override
  State<RecipeFiltersDialogue> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<RecipeFiltersDialogue> {
  late String _selectedCuisine = "";
  late String _selectedDiet = "";
  bool _withInstriuctuions = false;
  final List<TextFormField> _ingredientTextFiels = [];
  final List<String> _diets = [
    "Vegetarian",
    "Vegan",
    "Lacto-Vegetarian",
    "Pescetarian",
    "Ovo-Vegetarian",
  ];
  final List<String> _cuisines = [
    'African',
    'American',
    'Asian',
    'British',
    'Cajun',
    'Caribbean',
    'Chinese',
    'Eastern European',
    'European',
    'French',
    'German',
    'Greek',
    'Indian',
    'Irish',
    'Italian',
    'Japanese',
    'Jewish',
    'Korean',
    'Latin American',
    'Mediterranean',
    'Mexican',
    'Middle Eastern',
    'Nordic',
    'Southern',
    'Spanish',
    'Thai',
    'Vietnamese',
  ];
  @override
  void dispose() {
    for (final TextFormField field in _ingredientTextFiels) {
      field.controller!.dispose();
    }

    super.dispose();
  }

  Future<void> _applyFilters() async {}

  void _addIngredientTextField() {
    final newTextField = TextFormField(
      controller: TextEditingController(),
      decoration: InputDecoration(labelText: "Ingredient"),
    );
    setState(() {
      _ingredientTextFiels.add(newTextField);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog.fullscreen(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    hint: _selectedCuisine.isNotEmpty
                        ? Text(_selectedCuisine)
                        : Text("Select a Cuisine"),
                    items: _cuisines.map<DropdownMenuItem<String>>((
                      String cuisine,
                    ) {
                      return DropdownMenuItem<String>(
                        value: cuisine,
                        child: Center(child: Text(cuisine)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCuisine = value ?? _selectedCuisine;
                      });
                    },
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    hint: _selectedDiet.isNotEmpty
                        ? Text(_selectedDiet)
                        : Text("Select a Diet"),
                    items: _diets.map<DropdownMenuItem<String>>((String diet) {
                      return DropdownMenuItem<String>(
                        value: diet,
                        child: Center(child: Text(diet)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDiet = value ?? _selectedDiet;
                      });
                    },
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Include Instructions ?",
                        style: TextStyle(fontSize: 16),
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        value: _withInstriuctuions,
                        onChanged: (value) {
                          setState(() {
                            _withInstriuctuions = value ?? _withInstriuctuions;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    String ingredients = "";
                    for (final TextFormField field in _ingredientTextFiels) {
                      ingredients += field.controller!.text;
                      field.controller!.dispose();
                    }
                    final query = RecipeQuery(
                      cuisine: _selectedCuisine,
                      diet: _selectedDiet,
                      instructionsRequired: _withInstriuctuions,
                      includeIngredients: ingredients
                    );
                    context.read<RecipeSearchPageViewModel>().searchRecipes.execute(arg: query);
                    context.pop();
                  },
                  child: Text("Apply Filters"),
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
