import 'package:flutter/material.dart';

import './components/meal_item.dart';
import './../../models/category.dart';
import './../../models/meal.dart';
import './../../shared/mocks/category_and_meals_mock.dart';

class CategoryMealsPage extends StatefulWidget {
  static const String routeName = '/category-meals';

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle = '';
  List<Meal> displayedMeals = [];
  var _loadedInitDate = false;

  void _removeItemHandler(String mealId) {
    print(mealId);

    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitDate) {
      // Como estou usando context, não posso colocar esse dado dentro do initState
      final routeArgs = ModalRoute.of(context).settings.arguments as Category;

      this.categoryTitle = routeArgs.title;
      final categoryId = routeArgs.id;

      this.displayedMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      _loadedInitDate = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          meal: displayedMeals[index],
          removeItemHandler: _removeItemHandler,
        ),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
