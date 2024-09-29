import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mealdb_app/controllers/favorites_controller.dart';
import 'package:mealdb_app/models/recipe.dart';
import 'recipe_details_view.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<FavoritesController>(context).favoriteRecipes;

    return Scaffold(
      body: favorites.isEmpty
          ? Center(child: Text('Nenhuma receita favoritada'))
          : GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                Recipe recipe = favorites[index];
                return GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsView(recipe: recipe),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            recipe.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipe.name,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
