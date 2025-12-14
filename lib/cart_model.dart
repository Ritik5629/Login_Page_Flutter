import 'catalog.dart';

class CartModel {
  static final Map<Item, int> items = {};

  static void add(Item item) {
    items[item] = (items[item] ?? 0) + 1;
  }

  static void remove(Item item) {
    if (!items.containsKey(item)) return;
    if (items[item] == 1) {
      items.remove(item);
    } else {
      items[item] = items[item]! - 1;
    }
  }
}
