import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tinycolor/tinycolor.dart';

import './../../shared/mocks/category_and_meals_mock.dart';

class MealDetailsPage extends StatelessWidget {
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailsPage({this.toggleFavorite, this.isMealFavorite});

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
      floatingActionButton: _getFAB(context, mealId),
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

  Widget _getFAB(BuildContext context, String mealId) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Theme.of(context).primaryColorDark,
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.delete),
            backgroundColor: Colors.red,
            onTap: () {
              Navigator.of(context).pop(mealId);
            },
            label: 'Excluir',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.red),
        // FAB 2
        SpeedDialChild(
            child: Icon(
              isMealFavorite(mealId) ? Icons.star : Icons.star_border,
              color: Colors.black87,
            ),
            backgroundColor: Colors.yellow,
            onTap: () {
              toggleFavorite(mealId);
            },
            label: isMealFavorite(mealId) ? 'Desfavoritar' : 'Favoritar',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 16.0),
            labelBackgroundColor: Colors.yellow)
      ],
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
