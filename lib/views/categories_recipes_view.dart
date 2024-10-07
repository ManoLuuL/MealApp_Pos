import 'package:flutter/material.dart';
import 'package:mealdb_app/components/recipe_card.dart';
import 'package:mealdb_app/controllers/categories_controller.dart';
import 'package:mealdb_app/models/recipe_model.dart';
import 'recipe_details_view.dart';

class CategoryRecipesView extends StatefulWidget {
  final String category;

  const CategoryRecipesView({super.key, required this.category});

  @override
  State<CategoryRecipesView> createState() => _CategoryRecipesViewState();
}

class _CategoryRecipesViewState extends State<CategoryRecipesView> {
  final CategoryController controller = CategoryController();
  List<Recipe> recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  void fetchRecipes() async {
    try {
      List<Recipe> fetchedRecipes =
          await controller.fetchRecipesByCategory(widget.category);
      setState(() {
        recipes = fetchedRecipes;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categoria: ${widget.category}'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = recipes[index];
                return GestureDetector(
                    onTap: () async {
                      Recipe fullRecipe =
                          await controller.fetchRecipeDetails(recipe.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailsView(recipe: fullRecipe),
                        ),
                      );
                    },
                    child: RecipeCard(
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
                    ));
              },
            ),
    );
  }
}
