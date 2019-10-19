import 'package:flutter/material.dart';

import './app/pages/categories/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refeições',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoriesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
