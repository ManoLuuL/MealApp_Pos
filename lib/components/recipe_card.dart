import 'package:flutter/material.dart';
import 'package:mealdb_app/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final Function() onTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 3,
      child: ListTile(
        minTileHeight: 80,
        onTap: onTap,
        leading: Image.network(
          recipe.imageUrl,
          width: 100,
          fit: BoxFit.fill,
        ),
        title: Text(
          recipe.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
