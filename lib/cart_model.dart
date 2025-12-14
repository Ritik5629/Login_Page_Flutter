import 'catalog.dart';

class CartModel {
  static final Map<Item, int> _items = {};

  static Map<Item, int> get items => _items;

  static void add(Item item) {
    _items[item] = (_items[item] ?? 0) + 1;
  }

  static void remove(Item item) {
    if (!_items.containsKey(item)) return;
    if (_items[item] == 1) {
      _items.remove(item);
    } else {
      _items[item] = _items[item]! - 1;
    }
  }
}
