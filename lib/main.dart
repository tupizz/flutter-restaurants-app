import 'package:flutter/material.dart';

import './app/pages/categories/categories_page.dart';
import './app/pages/category-meals/category_meals_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refeições',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.blue,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(50, 0, 100, 0.3),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Color.fromRGBO(50, 0, 100, 0.35),
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ]),
            ),
      ),
      routes: {
        '/category-meals': (ctx) => CategoryMealsPage(),
      },
      home: CategoriesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
