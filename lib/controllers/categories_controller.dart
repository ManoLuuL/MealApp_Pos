import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mealdb_app/models/category_model.dart';
import 'package:mealdb_app/models/recipe_model.dart';

class CategoryController {
  static const String categoriesUrl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';
  static const String filterUrl =
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(categoriesUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['categories'];
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Recipe>> fetchRecipesByCategory(String category) async {
    final response = await http.get(Uri.parse('$filterUrl$category'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['meals'];
      return data.map((json) {
        return Recipe(
          id: json['idMeal'],
          name: json['strMeal'],
          imageUrl: json['strMealThumb'],
          instructions: '',
          ingredients: [],
        );
      }).toList();
    } else {
      throw Exception('Failed to load recipes for category');
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
