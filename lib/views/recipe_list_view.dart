import 'package:flutter/material.dart';
import 'package:mealdb_app/controllers/recipe_controller.dart';
import 'package:mealdb_app/models/recipe.dart';
import 'recipe_details_view.dart';

class RecipeListView extends StatefulWidget {
  @override
  _RecipeListViewState createState() => _RecipeListViewState();
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
      setState(() {
        recipes = fetchedRecipes;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Tratar erro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
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
