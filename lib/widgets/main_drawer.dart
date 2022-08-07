import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          buildListTile("Meals", Icons.restaurant, () => null),
          buildListTile("Filters", Icons.settings, () => null)
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData iconData, Function() tapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
