import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // TODO 11 Present GroceryItemsScreen
          },
        ),
        body: buildGroceryScreen(),
      );

  Widget buildGroceryScreen() {
    // 1
    return Consumer<GroceryManager>(
      // 2
      builder: (context, groceryManager, child) {
        // 3
        if (groceryManager.groceryItems.isNotEmpty) {
          // TODO 25: Add GroceryListScreen
          return Container();
        } else {
          // 4
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
