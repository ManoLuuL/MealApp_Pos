class Recipe {
  final String id;
  final String name;
  final String imageUrl;
  final String instructions;
  final List<String> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.instructions,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null && json['strIngredient$i'] != "") {
        ingredients.add(json['strIngredient$i']);
      }
    }
    return Recipe(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      instructions: json['strInstructions'],
      ingredients: ingredients,
    );
  }
}
