import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import './../../models/meal.dart';
import './../../shared/mocks/category_and_meals_mock.dart';

class MealDetailsPage extends StatelessWidget {
  static const String routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Container(
            width: 250,
            child: Text(
              selectedMeal.title,
              overflow: TextOverflow.ellipsis,
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Lista de ingredientes'),
            buildListOfItemsContainer(
              context: context,
              listView: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(
                        color: TinyColor(Theme.of(context).primaryColor)
                            .lighten(45)
                            .color,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildSectionTitle(context, 'Passos'),
            buildListOfItemsContainer(
              context: context,
              listView: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text(
                          '#${index + 1}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    )
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildListOfItemsContainer({
    BuildContext context,
    ListView listView,
  }) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: TinyColor(Theme.of(context).primaryColor).darken().color,
        border: Border.all(
          color: TinyColor(Theme.of(context).primaryColor).lighten().color,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      // Como usei border radius no container pai para fazer um efeito que o conteudo
      // está no interior e delimitado pelo pai precisei usar o ClipRRect
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: listView,
        ),
      ),
    );
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
