import 'package:flutter/material.dart';
import 'package:mealdb_app/controllers/category_controller.dart';
import 'package:mealdb_app/models/recipe.dart';
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
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
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
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            recipe.imageUrl,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipe.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
