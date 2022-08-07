import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void addToFavorites(String mealId) {
    final existingIndex =
        _favMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favMeals.add(_availableMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFav(String id) {
    return _favMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellow[100],
        primarySwatch: Colors.teal,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.orangeAccent,
              primary: Colors.teal,
            ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              favMeals: _favMeals,
            ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
              addToFav: addToFavorites,
              isFav: _isFav,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },
    );
  }
}
