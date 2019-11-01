import 'package:flutter/material.dart';

import './../../../models/meal.dart';
import './../../../pages/category-meals/components/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesPage({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Você ainda não tem nenhum prato favorito, comece adicionando alguns.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
            meal: favoriteMeals[index],
          ),
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
