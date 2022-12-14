import 'package:flutter/material.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widgets/main_drawer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(15.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        children: DUMMY_CATEGORIES
            .map((cat) =>
                CategoryItem(id: cat.id, title: cat.title, color: cat.color))
            .toList(),
      ),
    );
  }
}
