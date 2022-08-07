import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key, required this.favMeals}) : super(key: key);
  final List<Meal> favMeals;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            id: widget.favMeals[index].id,
            title: widget.favMeals[index].title,
            imageUrl: widget.favMeals[index].imageUrl,
            duration: widget.favMeals[index].duration,
            affordability: widget.favMeals[index].affordability,
            complexity: widget.favMeals[index].complexity,
            removeItem: (){},
          );
        },
        itemCount: widget.favMeals.length,
      );
    }
  }
}
