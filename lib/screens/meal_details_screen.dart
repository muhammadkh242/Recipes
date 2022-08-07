import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal_details_screen";

  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(selectedMeal.imageUrl),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Text(
                            "# ${index + 1}",
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(id);
        },
        child: const Icon(Icons.delete),

      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      height: 150,
      width: 350,
      child: child,
    );
  }
}
