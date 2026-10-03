import 'package:flutter/material.dart';

class CartItem {
  final String image;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart({
    required String image,
    required String name,
    required double price,
  }) {
    final index = _items.indexWhere(
          (item) =>
      item.name == name &&
          item.price == price,
    );

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(
        CartItem(
          image: image,
          name: name,
          price: price,
        ),
      );
    }

    notifyListeners();
  }

  void increaseQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }

    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (final item in _items) {
      total += item.price * item.quantity;
    }

    return total;
  }

  int get totalItems {
    int total = 0;

    for (final item in _items) {
      total += item.quantity;
    }

    return total;
  }
}