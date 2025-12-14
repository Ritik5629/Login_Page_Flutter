import 'package:flutter/material.dart';
import 'catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: ListTile(
          onTap: () {
            print("${item.name} pressed");
          },
          leading: Image.network(
            item.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(item.name),
          subtitle: Text(
            item.desc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            "\$${item.price}",
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
