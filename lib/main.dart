import 'package:flutter/material.dart';

import './app/pages/category-meals/category_meals_page.dart';
import './app/pages/meal-details/meal_details_page.dart';
import './app/pages/tabs/tabs_page.dart';
import './app/pages/filter/filter_page.dart';
import './app/models/meal.dart';
import './app/shared/mocks/category_and_meals_mock.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters({bool gluten, bool lactose, bool vegan, bool vegetarian}) {
    setState(() {
      _filters['gluten'] = gluten;
      _filters['lactose'] = lactose;
      _filters['vegan'] = vegan;
      _filters['vegetarian'] = vegetarian;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
    print(_filters);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refeições',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.blue,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(10, 0, 40, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              display1: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              display2: TextStyle(
                color: Colors.white70,
                fontSize: 12,
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
      // home: TabsPage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsPage(),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(_availableMeals),
        MealDetailsPage.routeName: (ctx) => MealDetailsPage(),
        FilterPage.routeName: (ctx) => FilterPage(
              setFilterHandler: _setFilters,
              filters: _filters,
            ),
      },
      // 404 like web
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => TabsPage());
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
