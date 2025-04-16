import 'package:flutter/widgets.dart';
import 'package:foodspot/models/cart.dart';
import 'package:foodspot/models/order_item.dart';

class CartNotifier extends ChangeNotifier {
  final Cart _cart = Cart(id: UniqueKey().toString(), orderItems: []);

  int get numOfItems => _cart.orderItems.fold(0, (v, oi) {
    v += oi.quantity;
    return v;
  });

  void addToCart(OrderItem orderItem) {
    _cart.orderItems.add(orderItem);
    notifyListeners();
  }
}
