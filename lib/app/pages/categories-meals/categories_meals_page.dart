import 'package:flutter/material.dart';

class CategoriesMealsPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoriesMealsPage({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: Container(),
    );
  }
}
