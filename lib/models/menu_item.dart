import 'package:foodspot/shop_data.dart';

enum MenuTab {
  tacos,
  burritos,
  tortas,
  quesadillas,
  drinks;

  String get label {
    switch (this) {
      case MenuTab.tacos:
        return "Tacos";
      case MenuTab.burritos:
        return "Burritos";
      case MenuTab.tortas:
        return "Tortas";
      case MenuTab.quesadillas:
        return "Quesadillas";
      case MenuTab.drinks:
        return "Drinks";
    }
  }
}

class MenuItem {
  final MenuTab forTab;
  final String label;
  final String imagePath;
  final String description;
  final List<String> defaultMeat;
  final List<String> defaultToppings;
  final double price;

  const MenuItem({
    required this.forTab,
    required this.label,
    required this.imagePath,
    required this.description,
    required this.defaultMeat,
    required this.defaultToppings,
    required this.price,
  });
}
