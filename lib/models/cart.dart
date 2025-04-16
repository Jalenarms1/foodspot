import 'package:foodspot/models/order_item.dart';

class Cart {
  final String id;
  final List<OrderItem> orderItems;

  Cart({required this.id, required this.orderItems});
}
