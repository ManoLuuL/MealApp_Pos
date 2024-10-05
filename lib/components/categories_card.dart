import 'package:flutter/material.dart';
import 'package:mealdb_app/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function() onTap;

  const CategoryCard({
    super.key,
    required this.category,
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
          category.thumbnail,
          width: 100,
          fit: BoxFit.fill,
        ),
        title: Text(
          category.name,
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
