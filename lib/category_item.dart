import 'package:flutter/material.dart';
import 'package:meals/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  final String id;
  final String title;
  final Color color;

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return CategoryMealsScreen(
          catTitle: title,
          catId: id,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
