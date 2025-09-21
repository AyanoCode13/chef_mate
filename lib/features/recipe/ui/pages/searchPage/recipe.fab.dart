import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipesFab extends StatelessWidget {
  const RecipesFab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      onPressed: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (context, _, _) {
            return _FiltersDialog();
          },
        );
      },
      child: Icon(Icons.filter_list_alt),
    );
  }
}

class _FiltersDialog extends StatefulWidget {
  @override
  State<_FiltersDialog> createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<_FiltersDialog> {
  late String? _selectedCuisine;
  late String? _selectedDiet;
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

  void _applyFilters() {
    String ingredients = "";
    for (final TextFormField field in _ingredientTextFiels) {
      if (field.controller!.text.isNotEmpty) {
        final int crtElemIndex = _ingredientTextFiels.indexOf(field);
        if (crtElemIndex < _ingredientTextFiels.length - 1 &&
            _ingredientTextFiels.length > 1 &&
            _ingredientTextFiels
                .elementAt(crtElemIndex + 1)
                .controller!
                .text
                .isNotEmpty) {
          print(_ingredientTextFiels.indexOf(field));
          ingredients += "${field.controller!.text},";
        } else {
          ingredients += field.controller!.text;
        }
      }
      print(ingredients);
      field.controller!.dispose();
    }
    print(ingredients);
    setState(() {
      _ingredientTextFiels.clear();
    });
  }

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
    return SafeArea(
      child: Dialog(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    hint: Text("Select a Cuisine"),
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
                    hint: Text("Select a Diet"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ingredients ? "),
                      IconButton(
                        onPressed: () {
                          _addIngredientTextField();
                        },
                        icon: Icon(Icons.add_outlined),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: ListView.builder(
                        itemCount: _ingredientTextFiels.length,
                        itemBuilder: (context, index) {
                          return _ingredientTextFiels.elementAt(index);
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Include Instructions ?"),
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
                    _applyFilters();
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
