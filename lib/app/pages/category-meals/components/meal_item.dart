import 'package:flutter/material.dart';
import './../../../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({this.meal});

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // cria um componente que permite criar widget um em cima do outro "3D"
            Stack(
              children: <Widget>[
                // forçar a imagem a parecer contida pelo pai (ideia parecida com o clip do photoshop)
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Quando se trabalha com stack pode-se usar o positioned que vc coloca o seu elemento onde quiser
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 230,
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 22,
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(0, 0, 0, 0.85),
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      // Para funcionar o texto precisa ser encapsulado por um container
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(meal.affordabilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
