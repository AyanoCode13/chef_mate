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
  final int? offset;
  final int? number;

  
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
    this.offset = 0,
    this.number = 30,
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
      
    );
  }

  // Method to convert to query string
  String toQueryString() {
    final params = toQueryParameters();
    if (params.isEmpty) return '';
    
    return '?${params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')}';
  }
}