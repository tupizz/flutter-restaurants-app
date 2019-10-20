import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Pricey:
        return 'Barato';
      case Affordability.Affordable:
        return 'Médio';
      case Affordability.Luxurious:
        return 'Caro';
      default:
        return 'Não conhecido';
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Challenging:
        return 'Médio';
      case Complexity.Hard:
        return 'Difícil';
      default:
        return 'Não conhecido';
    }
  }
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
