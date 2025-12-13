import 'package:flutter/material.dart';
import 'package:login_page/drawer.dart';
import 'package:login_page/catalog.dart';
import 'package:login_page/item_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CatalogModel.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.deepPurple,
      ),

      drawer: const AppDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: items[index]);
          },
        ),
      ),
    );
  }
}
