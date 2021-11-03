import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';

import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // 1
            final groceryManager =
                Provider.of<GroceryManager>(context, listen: false);
// 2
            Navigator.push(
              context,
              // 3
              MaterialPageRoute(
                // 4
                builder: (context) => GroceryItemScreen(
                  // 5
                  onCreate: (item) {
                    // 6
                    groceryManager.addItem(item);
                    // 7
                    Navigator.pop(context);
                  },
                  // 8
                  onUpdate: (item) {},
                ),
              ),
            );
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
          return GroceryListScreen(groceryManager: groceryManager);
        } else {
          // 4
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
