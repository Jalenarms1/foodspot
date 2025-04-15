import 'package:foodspot/models/menu_item.dart';

class OrderItem {
  String id;
  MenuItem menuItem;
  List<String> selectedMeats;
  List<String> selectedToppings;
  String specialInstructions;
  int quantity;

  OrderItem({
    required this.id,
    required this.menuItem,
    required this.selectedMeats,
    required this.selectedToppings,
    required this.specialInstructions,
    required this.quantity,
  });
}
