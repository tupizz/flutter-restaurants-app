import 'package:flutter/material.dart';

import './categories/categories_page.dart';
import './favorites/favorites_page.dart';
import './../../models/meal.dart';
import './../../shared/components/main-drawer/main_drawer.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsPage({this.favoriteMeals});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('App Restaurante'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                  size: 22,
                ),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                  size: 22,
                ),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesPage(),
            FavoritesPage(favoriteMeals: widget.favoriteMeals),
          ],
        ),
      ),
    );
  }
}
