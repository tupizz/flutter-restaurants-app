import 'package:flutter/material.dart';

import './components/meal_item.dart';
import './../../models/category.dart';
import './../../shared/mocks/category_and_meals_mock.dart';

class CategoryMealsPage extends StatelessWidget {
  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Category;

    final categoryTitle = routeArgs.title;
    final categoryId = routeArgs.id;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(meal: categoryMeals[index]),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
