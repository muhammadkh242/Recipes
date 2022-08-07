import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String catTitle;
  late List<Meal> categoryMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    catTitle = args['title'] ?? "";
    final catId = args['id'];
    categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
