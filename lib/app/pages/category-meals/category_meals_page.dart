import 'package:flutter/material.dart';
import 'package:restaurant_meals_app/app/models/category.dart';

class CategoryMealsPage extends StatelessWidget {
  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Category;

    final categoryTitle = routeArgs.title;
    final categoryId = routeArgs.id;
    final categoryColor = routeArgs.color;

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: Container(),
    );
  }
}
