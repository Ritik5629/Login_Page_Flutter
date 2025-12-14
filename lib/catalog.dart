import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  static void loadFromJson(String jsonString) {
    final decodedData = jsonDecode(jsonString);
    final List products = decodedData["products"];

    items = products.map((item) => Item.fromJson(item)).toList();
  }
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
}
