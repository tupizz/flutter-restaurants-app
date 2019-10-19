import 'package:flutter/material.dart';
import 'package:restaurant_meals_app/app/pages/categories/categories_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refeições'),
      ),
      body: Center(
        child: CategoriesPage(),
      ),
    );
  }
}
