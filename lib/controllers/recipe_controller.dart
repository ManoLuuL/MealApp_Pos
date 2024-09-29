import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mealdb_app/models/recipe.dart';

class RecipeController {
  static const String apiUrl =
      'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Recipe>> fetchRecipes(String query) async {
    final response = await http.get(Uri.parse('$apiUrl$query'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['meals'];
      return data.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<Recipe> fetchRecipeDetails(String id) async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body)['meals'][0];
      return Recipe.fromJson(data);
    } else {
      throw Exception('Failed to load recipe details');
    }
  }
}
