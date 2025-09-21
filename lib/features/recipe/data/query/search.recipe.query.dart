class RecipeQuery {
  // Basic search parameters
  final String? query;
  final String? cuisine;
  final String? excludeCuisine;
  final String? diet;
  final String? intolerances;
  final String? equipment;
  final String? includeIngredients;
  final String? excludeIngredients;
  final String? type;

  // Recipe information parameters
  final bool? instructionsRequired;
  final bool? fillIngredients;
  final bool? addRecipeInformation;
  final bool? addRecipeInstructions;
  final bool? addRecipeNutrition;

  // Filter parameters
  final String? author;
  final String? tags;
  final int? recipeBoxId;
  final String? titleMatch;
  final int? maxReadyTime;
  final int? minServings;
  final int? maxServings;
  final bool? ignorePantry;

  // Sorting and pagination
  final String? sort;
  final String? sortDirection;
  late int? offset = 0;
  late int? number = 10;

  // Nutritional constraints - Macronutrients
  final int? minCalories;
  final int? maxCalories;
  final int? minCarbs;
  final int? maxCarbs;
  final int? minProtein;
  final int? maxProtein;
  final int? minFat;
  final int? maxFat;

  // Nutritional constraints - Other nutrients
  final int? minAlcohol;
  final int? maxAlcohol;
  final int? minCaffeine;
  final int? maxCaffeine;
  final int? minCopper;
  final int? maxCopper;
  final int? minCalcium;
  final int? maxCalcium;
  final int? minCholine;
  final int? maxCholine;
  final int? minCholesterol;
  final int? maxCholesterol;
  final int? minFluoride;
  final int? maxFluoride;
  final int? minSaturatedFat;
  final int? maxSaturatedFat;

  // Vitamins
  final int? minVitaminA;
  final int? maxVitaminA;
  final int? minVitaminC;
  final int? maxVitaminC;
  final int? minVitaminD;
  final int? maxVitaminD;
  final int? minVitaminE;
  final int? maxVitaminE;
  final int? minVitaminK;
  final int? maxVitaminK;
  final int? minVitaminB1;
  final int? maxVitaminB1;
  final int? minVitaminB2;
  final int? maxVitaminB2;
  final int? minVitaminB5;
  final int? maxVitaminB5;
  final int? minVitaminB3;
  final int? maxVitaminB3;
  final int? minVitaminB6;
  final int? maxVitaminB6;
  final int? minVitaminB12;
  final int? maxVitaminB12;

  // Additional nutrients
  final int? minFiber;
  final int? maxFiber;
  final int? minFolate;
  final int? maxFolate;
  final int? minFolicAcid;
  final int? maxFolicAcid;
  final int? minIodine;
  final int? maxIodine;
  final int? minIron;
  final int? maxIron;
  final int? minMagnesium;
  final int? maxMagnesium;
  final int? minManganese;
  final int? maxManganese;
  final int? minPhosphorus;
  final int? maxPhosphorus;
  final int? minPotassium;
  final int? maxPotassium;
  final int? minSelenium;
  final int? maxSelenium;
  final int? minSodium;
  final int? maxSodium;
  final int? minSugar;
  final int? maxSugar;
  final int? minZinc;
  final int? maxZinc;

  // Constructor with named parameters
  RecipeQuery({
    // Basic search parameters
    this.query,
    this.cuisine,
    this.excludeCuisine,
    this.diet,
    this.intolerances,
    this.equipment,
    this.includeIngredients,
    this.excludeIngredients,
    this.type,
    
    // Recipe information parameters
    this.instructionsRequired,
    this.fillIngredients,
    this.addRecipeInformation,
    this.addRecipeInstructions,
    this.addRecipeNutrition,
    
    // Filter parameters
    this.author,
    this.tags,
    this.recipeBoxId,
    this.titleMatch,
    this.maxReadyTime,
    this.minServings,
    this.maxServings,
    this.ignorePantry,
    
    // Sorting and pagination
    this.sort,
    this.sortDirection,
    this.offset,
    this.number,
    
    // Nutritional constraints - Macronutrients
    this.minCalories,
    this.maxCalories,
    this.minCarbs,
    this.maxCarbs,
    this.minProtein,
    this.maxProtein,
    this.minFat,
    this.maxFat,
    
    // Nutritional constraints - Other nutrients
    this.minAlcohol,
    this.maxAlcohol,
    this.minCaffeine,
    this.maxCaffeine,
    this.minCopper,
    this.maxCopper,
    this.minCalcium,
    this.maxCalcium,
    this.minCholine,
    this.maxCholine,
    this.minCholesterol,
    this.maxCholesterol,
    this.minFluoride,
    this.maxFluoride,
    this.minSaturatedFat,
    this.maxSaturatedFat,
    
    // Vitamins
    this.minVitaminA,
    this.maxVitaminA,
    this.minVitaminC,
    this.maxVitaminC,
    this.minVitaminD,
    this.maxVitaminD,
    this.minVitaminE,
    this.maxVitaminE,
    this.minVitaminK,
    this.maxVitaminK,
    this.minVitaminB1,
    this.maxVitaminB1,
    this.minVitaminB2,
    this.maxVitaminB2,
    this.minVitaminB5,
    this.maxVitaminB5,
    this.minVitaminB3,
    this.maxVitaminB3,
    this.minVitaminB6,
    this.maxVitaminB6,
    this.minVitaminB12,
    this.maxVitaminB12,
    
    // Additional nutrients
    this.minFiber,
    this.maxFiber,
    this.minFolate,
    this.maxFolate,
    this.minFolicAcid,
    this.maxFolicAcid,
    this.minIodine,
    this.maxIodine,
    this.minIron,
    this.maxIron,
    this.minMagnesium,
    this.maxMagnesium,
    this.minManganese,
    this.maxManganese,
    this.minPhosphorus,
    this.maxPhosphorus,
    this.minPotassium,
    this.maxPotassium,
    this.minSelenium,
    this.maxSelenium,
    this.minSodium,
    this.maxSodium,
    this.minSugar,
    this.maxSugar,
    this.minZinc,
    this.maxZinc,
  });

  // Method to convert the query to a parameter map
  Map<String, String> toQueryParameters() {
    final Map<String, String> queryParams = {};

    // Helper function to add non-null values
    void addIfNotNull(String key, dynamic value) {
      if (value != null) {
        queryParams[key] = value.toString();
      }
    }

    // Basic search parameters
    addIfNotNull('query', query);
    addIfNotNull('cuisine', cuisine);
    addIfNotNull('excludeCuisine', excludeCuisine);
    addIfNotNull('diet', diet);
    addIfNotNull('intolerances', intolerances);
    addIfNotNull('equipment', equipment);
    addIfNotNull('includeIngredients', includeIngredients);
    addIfNotNull('excludeIngredients', excludeIngredients);
    addIfNotNull('type', type);

    // Recipe information parameters
    addIfNotNull('instructionsRequired', instructionsRequired);
    addIfNotNull('fillIngredients', fillIngredients);
    addIfNotNull('addRecipeInformation', addRecipeInformation);
    addIfNotNull('addRecipeInstructions', addRecipeInstructions);
    addIfNotNull('addRecipeNutrition', addRecipeNutrition);

    // Filter parameters
    addIfNotNull('author', author);
    addIfNotNull('tags', tags);
    addIfNotNull('recipeBoxId', recipeBoxId);
    addIfNotNull('titleMatch', titleMatch);
    addIfNotNull('maxReadyTime', maxReadyTime);
    addIfNotNull('minServings', minServings);
    addIfNotNull('maxServings', maxServings);
    addIfNotNull('ignorePantry', ignorePantry);

    // Sorting and pagination
    addIfNotNull('sort', sort);
    addIfNotNull('sortDirection', sortDirection);
    addIfNotNull('offset', offset);
    addIfNotNull('number', number);

    // Nutritional constraints
    addIfNotNull('minCalories', minCalories);
    addIfNotNull('maxCalories', maxCalories);
    addIfNotNull('极速飞艇开奖直播rbs', minCarbs);
    addIfNotNull('maxCarbs', maxCarbs);
    addIfNotNull('minProtein', minProtein);
    addIfNotNull('maxProtein', maxProtein);
    addIfNotNull('minFat', minFat);
    addIfNotNull('maxFat', maxFat);
    addIfNotNull('minAlcohol', minAlcohol);
    addIfNotNull('maxAlcohol', maxAlcohol);
    addIfNotNull('minCaffeine', minCaffeine);
    addIfNotNull('maxCaffeine', maxCaffeine);
    addIfNotNull('minCopper', minCopper);
    addIfNotNull('maxCopper', maxCopper);
    addIfNotNull('minCalcium', minCalcium);
    addIfNotNull('maxCalcium', maxCalcium);
    addIfNotNull('minCholine', minCholine);
    addIfNotNull('maxCholine', maxCholine);
    addIfNotNull('minCholesterol', minCholesterol);
    addIfNotNull('maxCholesterol', maxCholesterol);
    addIfNotNull('minFluoride', minFluoride);
    addIfNotNull('maxFluoride', maxFluoride);
    addIfNotNull('minSaturatedFat', minSaturatedFat);
    addIfNotNull('maxSaturatedFat', maxSaturatedFat);
    addIfNotNull('minVitaminA', minVitaminA);
    addIfNotNull('maxVitaminA', maxVitaminA);
    addIfNotNull('minVitaminC', minVitaminC);
    addIfNotNull('maxVitaminC', maxVitaminC);
    addIfNotNull('minVitaminD', minVitaminD);
    addIfNotNull('maxVitaminD', maxVitaminD);
    addIfNotNull('minVitaminE', minVitaminE);
    addIfNotNull('maxVitaminE', maxVitaminE);
    addIfNotNull('minVitaminK', minVitaminK);
    addIfNotNull('maxVitaminK', maxVitaminK);
    addIfNotNull('minVitaminB1', minVitaminB1);
    addIfNotNull('maxVitaminB1', maxVitaminB1);
    addIfNotNull('minVitaminB2', minVitaminB2);
    addIfNotNull('maxVitaminB2', maxVitaminB2);
    addIfNotNull('minVitaminB5', minVitaminB5);
    addIfNotNull('maxVitaminB5', maxVitaminB5);
    addIfNotNull('minVitaminB3', minVitaminB3);
    addIfNotNull('maxVitaminB3', maxVitaminB3);
    addIfNotNull('minVitaminB6', minVitaminB6);
    addIfNotNull('maxVitaminB6', maxVitaminB6);
    addIfNotNull('minVitaminB12', minVitaminB12);
    addIfNotNull('maxVitaminB12', maxVitaminB12);
    addIfNotNull('minFiber', minFiber);
    addIfNotNull('maxFiber', maxFiber);
    addIfNotNull('minFolate', minFolate);
    addIfNotNull('maxFolate', maxFolate);
    addIfNotNull('minFolicAcid', minFolicAcid);
    addIfNotNull('maxFolicAcid', maxFolicAcid);
    addIfNotNull('minIodine', minIodine);
    addIfNotNull('maxIodine', maxIodine);
    addIfNotNull('minIron', minIron);
    addIfNotNull('maxIron', maxIron);
    addIfNotNull('minMagnesium', minMagnesium);
    addIfNotNull('maxMagnesium', maxMagnesium);
    addIfNotNull('minManganese', minManganese);
    addIfNotNull('maxManganese', maxManganese);
    addIfNotNull('minPhosphorus', minPhosphorus);
    addIfNotNull('maxPhosphorus', maxPhosphorus);
    addIfNotNull('minPotassium', minPotassium);
    addIfNotNull('maxPotassium', maxPotassium);
    addIfNotNull('minSelenium', minSelenium);
    addIfNotNull('maxSelenium', maxSelenium);
    addIfNotNull('minSodium', minSodium);
    addIfNotNull('maxSodium', maxSodium);
    addIfNotNull('minSugar', minSugar);
    addIfNotNull('maxSugar', maxSugar);
    addIfNotNull('minZinc', minZinc);
    addIfNotNull('maxZinc', maxZinc);

    return queryParams;
  }
  RecipeQuery merge(RecipeQuery other) {
    return RecipeQuery(
      // Basic search parameters
      query: other.query ?? query,
      cuisine: other.cuisine ?? cuisine,
      excludeCuisine: other.excludeCuisine ?? excludeCuisine,
      diet: other.diet ?? diet,
      intolerances: other.intolerances ?? intolerances,
      equipment: other.equipment ?? equipment,
      includeIngredients: other.includeIngredients ?? includeIngredients,
      excludeIngredients: other.excludeIngredients ?? excludeIngredients,
      type: other.type ?? type,
      
      // Recipe information parameters
      instructionsRequired: other.instructionsRequired ?? instructionsRequired,
      fillIngredients: other.fillIngredients ?? fillIngredients,
      addRecipeInformation: other.addRecipeInformation ?? addRecipeInformation,
      addRecipeInstructions: other.addRecipeInstructions ?? addRecipeInstructions,
      addRecipeNutrition: other.addRecipeNutrition ?? addRecipeNutrition,
      
      // Filter parameters
      author: other.author ?? author,
      tags: other.tags ?? tags,
      recipeBoxId: other.recipeBoxId ?? recipeBoxId,
      titleMatch: other.titleMatch ?? titleMatch,
      maxReadyTime: other.maxReadyTime ?? maxReadyTime,
      minServings: other.minServings ?? minServings,
      maxServings: other.maxServings ?? maxServings,
      ignorePantry: other.ignorePantry ?? ignorePantry,
      
      // Sorting and pagination
      sort: other.sort ?? sort,
      sortDirection: other.sortDirection ?? sortDirection,
      offset: other.offset ?? offset,
      number: other.number ?? number,
      
      // Nutritional constraints - Macronutrients
      minCalories: other.minCalories ?? minCalories,
      maxCalories: other.maxCalories ?? maxCalories,
      minCarbs: other.minCarbs ?? minCarbs,
      maxCarbs: other.maxCarbs ?? maxCarbs,
      minProtein: other.minProtein ?? minProtein,
      maxProtein: other.maxProtein ?? maxProtein,
      minFat: other.minFat ?? minFat,
      maxFat: other.maxFat ?? maxFat,
      
      // Nutritional constraints - Other nutrients
      minAlcohol: other.minAlcohol ?? minAlcohol,
      maxAlcohol: other.maxAlcohol ?? maxAlcohol,
      minCaffeine: other.minCaffeine ?? minCaffeine,
      maxCaffeine: other.maxCaffeine ?? maxCaffeine,
      minCopper: other.minCopper ?? minCopper,
      maxCopper: other.maxCopper ?? maxCopper,
      minCalcium: other.minCalcium ?? minCalcium,
      maxCalcium: other.maxCalcium ?? maxCalcium,
      minCholine: other.minCholine ?? minCholine,
      maxCholine: other.maxCholine ?? maxCholine,
      minCholesterol: other.minCholesterol ?? minCholesterol,
      maxCholesterol: other.maxCholesterol ?? maxCholesterol,
      minFluoride: other.minFluoride ?? minFluoride,
      maxFluoride: other.maxFluoride ?? maxFluoride,
      minSaturatedFat: other.minSaturatedFat ?? minSaturatedFat,
      maxSaturatedFat: other.maxSaturatedFat ?? maxSaturatedFat,
      
      // Vitamins
      minVitaminA: other.minVitaminA ?? minVitaminA,
      maxVitaminA: other.maxVitaminA ?? maxVitaminA,
      minVitaminC: other.minVitaminC ?? minVitaminC,
      maxVitaminC: other.maxVitaminC ?? maxVitaminC,
      minVitaminD: other.minVitaminD ?? minVitaminD,
      maxVitaminD: other.maxVitaminD ?? maxVitaminD,
      minVitaminE: other.minVitaminE ?? minVitaminE,
      maxVitaminE: other.maxVitaminE ?? maxVitaminE,
      minVitaminK: other.minVitaminK ?? minVitaminK,
      maxVitaminK: other.maxVitaminK ?? maxVitaminK,
      minVitaminB1: other.minVitaminB1 ?? minVitaminB1,
      maxVitaminB1: other.maxVitaminB1 ?? maxVitaminB1,
      minVitaminB2: other.minVitaminB2 ?? minVitaminB2,
      maxVitaminB2: other.maxVitaminB2 ?? maxVitaminB2,
      minVitaminB5: other.minVitaminB5 ?? minVitaminB5,
      maxVitaminB5: other.maxVitaminB5 ?? maxVitaminB5,
      minVitaminB3: other.minVitaminB3 ?? minVitaminB3,
      maxVitaminB3: other.maxVitaminB3 ?? maxVitaminB3,
      minVitaminB6: other.minVitaminB6 ?? minVitaminB6,
      maxVitaminB6: other.maxVitaminB6 ?? maxVitaminB6,
      minVitaminB12: other.minVitaminB12 ?? minVitaminB12,
      maxVitaminB12: other.maxVitaminB12 ?? maxVitaminB12,
      
      // Additional nutrients
      minFiber: other.minFiber ?? minFiber,
      maxFiber: other.maxFiber ?? maxFiber,
      minFolate: other.minFolate ?? minFolate,
      maxFolate: other.maxFolate ?? maxFolate,
      minFolicAcid: other.minFolicAcid ?? minFolicAcid,
      maxFolicAcid: other.maxFolicAcid ?? maxFolicAcid,
      minIodine: other.minIodine ?? minIodine,
      maxIodine: other.maxIodine ?? maxIodine,
      minIron: other.minIron ?? minIron,
      maxIron: other.maxIron ?? maxIron,
      minMagnesium: other.minMagnesium ?? minMagnesium,
      maxMagnesium: other.maxMagnesium ?? maxMagnesium,
      minManganese: other.minManganese ?? minManganese,
      maxManganese: other.maxManganese ?? maxManganese,
      minPhosphorus: other.minPhosphorus ?? minPhosphorus,
      maxPhosphorus: other.maxPhosphorus ?? maxPhosphorus,
      minPotassium: other.minPotassium ?? minPotassium,
      maxPotassium: other.maxPotassium ?? maxPotassium,
      minSelenium: other.minSelenium ?? minSelenium,
      maxSelenium: other.maxSelenium ?? maxSelenium,
      minSodium: other.minSodium ?? minSodium,
      maxSodium: other.maxSodium ?? maxSodium,
      minSugar: other.minSugar ?? minSugar,
      maxSugar: other.maxSugar ?? maxSugar,
      minZinc: other.minZinc ?? minZinc,
      maxZinc: other.maxZinc ?? maxZinc,
    );
  }
  RecipeQuery reset() {
    return RecipeQuery();
  }
  // Method to convert to query string
  String toQueryString() {
    final params = toQueryParameters();
    if (params.isEmpty) return '';
    
    return '?${params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')}';
  }
}