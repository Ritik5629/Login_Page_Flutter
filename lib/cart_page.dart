import 'package:flutter/material.dart';
import 'cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: CartModel.items.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : ListView(
              children: CartModel.items.entries.map((entry) {
                final item = entry.key;
                final qty = entry.value;

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("\$${item.price}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            CartModel.remove(item);
                          });
                        },
                      ),
                      Text(qty.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            CartModel.add(item);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}
