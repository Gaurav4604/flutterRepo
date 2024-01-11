import 'dart:collection';

import 'package:flutter/material.dart';

class Item {
  final String _title;
  Item({required String title}) : _title = title;

  String get title => _title;
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => _items.length + 42;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
