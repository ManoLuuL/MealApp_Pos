import 'package:flutter/material.dart';
import 'package:mealdb_app/models/recipe.dart';
import 'package:provider/provider.dart';
import 'package:mealdb_app/controllers/favorites_controller.dart';

class RecipeDetailsView extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsView({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoritesController = Provider.of<FavoritesController>(context);

    bool isFavorite = favoritesController.favoriteRecipes.contains(recipe);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        // Envolvendo o conteúdo em SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(recipe.imageUrl),
              SizedBox(height: 16),
              Text(
                'Ingredientes:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...recipe.ingredients.map((ingredient) => Text('- $ingredient')),
              SizedBox(height: 16),
              Text(
                'Instruções:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(recipe.instructions),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    favoritesController.toggleFavorite(recipe);
                  },
                  child: Text(isFavorite ? 'Desfavoritar' : 'Favoritar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
