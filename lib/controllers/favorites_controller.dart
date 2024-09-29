import 'package:flutter/material.dart';
import 'package:mealdb_app/models/recipe.dart';

class FavoritesController extends ChangeNotifier {
  List<Recipe> _favoriteRecipes = [];

  List<Recipe> get favoriteRecipes => _favoriteRecipes;

  void toggleFavorite(Recipe recipe) {
    if (_favoriteRecipes.contains(recipe)) {
      _favoriteRecipes.remove(recipe);
    } else {
      _favoriteRecipes.add(recipe);
    }
    notifyListeners();
  }
}
