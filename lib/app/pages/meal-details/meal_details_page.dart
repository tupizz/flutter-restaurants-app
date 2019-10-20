import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  static const String routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('teste $mealId'),
      ),
      body: Container(
        child: Center(
          child: Text('Oi $mealId'),
        ),
      ),
    );
  }
}
