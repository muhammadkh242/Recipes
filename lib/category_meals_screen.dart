import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen(
      {Key? key, required this.catId, required this.catTitle})
      : super(key: key);

  final String catId;
  final String catTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        catTitle,
      )),
    );
  }
}
