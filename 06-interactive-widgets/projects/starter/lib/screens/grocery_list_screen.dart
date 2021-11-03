import 'package:flutter/material.dart';
import '../../../components/grocery_tile.dart';
import '../../../models/models.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager groceryManager;

  const GroceryListScreen({
    Key? key,
    required this.groceryManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
// 1
    final groceryItems = groceryManager.groceryItems;
// 2
    return Padding(
      padding: const EdgeInsets.all(16.0),
      // 3
      child: ListView.separated(
        // 4
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          // TODO 28: Wrap in a Dismissable
          // TODO 27: Wrap in an InkWell
          // 5
          return GroceryTile(
            key: Key(item.id),
            item: item,
            // 6
            onComplete: (newValue) {
              // 7
              if (newValue != null) {
                groceryManager.completeItem(index, newValue);
              }
            },
          );
        },
        // 8
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
