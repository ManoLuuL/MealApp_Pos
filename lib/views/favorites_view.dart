import 'package:flutter/material.dart';
import 'package:mealdb_app/components/recipe_card.dart';
import 'package:mealdb_app/providers/favorites_providers.dart';
import 'package:provider/provider.dart';
import 'package:mealdb_app/models/recipe_model.dart';
import 'package:mealdb_app/views/recipe_details_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<FavoritesProvider>(context).favoriteRecipes;

    return Scaffold(
      body: favorites.isEmpty
          ? const Center(child: Text('Nenhuma receita favoritada'))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                Recipe recipe = favorites[index];

                return RecipeCard(
                  recipe: recipe,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsView(recipe: recipe),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
