import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/drawer.dart';
import 'package:login_page/catalog.dart';
import 'package:login_page/item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );

    CatalogModel.loadFromJson(catalogJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: const AppDrawer(),
      body: CatalogModel.items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: CatalogModel.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: CatalogModel.items[index]);
              },
            ),
    );
  }
}
