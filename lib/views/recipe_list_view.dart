import 'package:flutter/material.dart';
import 'package:mealdb_app/components/recipe_card.dart';
import 'package:mealdb_app/controllers/recipe_controller.dart';
import 'package:mealdb_app/models/recipe.dart';
import 'package:mealdb_app/views/recipe_details_view.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({super.key});

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  final RecipeController controller = RecipeController();
  List<Recipe> recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  void fetchRecipes() async {
    try {
      List<Recipe> fetchedRecipes = await controller.fetchRecipes('');
      if (mounted) {
        setState(() {
          recipes = fetchedRecipes;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = recipes[index];

                return RecipeCard(
                  recipe: recipe,
                  onTap: () async {
                    Recipe fullRecipe =
                        await controller.fetchRecipeDetails(recipe.id);

                    if (mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailsView(recipe: fullRecipe),
                        ),
                      );
                    }
                  },
                );
              },
            ),
    );
  }
}
