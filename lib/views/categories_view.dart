import 'package:flutter/material.dart';
import 'package:mealdb_app/components/categories_card.dart';
import 'package:mealdb_app/controllers/categories_controller.dart';
import 'package:mealdb_app/models/category_model.dart';
import 'package:mealdb_app/views/categories_recipes_view.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoriesView> {
  final CategoryController controller = CategoryController();
  List<Category> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      List<Category> fetchedCategories = await controller.fetchCategories();
      if (mounted) {
        setState(() {
          categories = fetchedCategories;
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
              itemCount: categories.length,
              itemBuilder: (context, index) {
                Category category = categories[index];

                return CategoryCard(
                  category: category,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryRecipesView(category: category.name),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
