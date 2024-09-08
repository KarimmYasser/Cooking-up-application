import 'package:cooking_up/data/dummy_data.dart';
import 'package:cooking_up/models/category.dart';
import 'package:cooking_up/models/meal.dart';
import 'package:cooking_up/screens/meals.dart';
import 'package:cooking_up/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.mealsToShow});

  final List<Meal> mealsToShow;

  void _selectCategory(BuildContext context, Category category) {
    final filteredmeals = mealsToShow
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredmeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onselectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
