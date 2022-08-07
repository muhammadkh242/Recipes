import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favMeals}) : super(key: key);
  final List<Meal> favMeals;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': const CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(favMeals: widget.favMeals,),
        'title': 'Your Favorite',
      },
    ];    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
