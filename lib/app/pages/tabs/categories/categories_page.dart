import 'package:flutter/material.dart';

import './components/category_item.dart';

import './../../../shared/mocks/category_and_meals_mock.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      children: DUMMY_CATEGORIES
          .map((categoryData) => CategoryItem(
                id: categoryData.id,
                color: categoryData.color,
                title: categoryData.title,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
