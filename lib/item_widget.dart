import 'package:flutter/material.dart';
import 'catalog.dart';
import 'cart_model.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Image.network(item.image, width: 50, height: 50, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(item.desc, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(
                  "\$${item.price}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              CartModel.add(item);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Item added to cart"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: const Text("Buy"),
          ),
        ],
      ),
    );
  }
}
