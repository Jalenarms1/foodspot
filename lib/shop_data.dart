import 'package:foodspot/models/menu_item.dart';

class ShopData {
  static String label = "Lalocura";
  static String subLabel = "Tacos Del Valle";
  static List<MenuTab> menuTabs = [
    MenuTab.tacos,
    MenuTab.burritos,
    MenuTab.tortas,
    MenuTab.quesadillas,
    MenuTab.drinks,
  ];
  static Map<MenuTab, List<MenuItem>> menuTabItems = {
    MenuTab.tacos: [
      MenuItem(
        forTab: MenuTab.tacos,
        label: "Carne Asada Taco Platter",
        imagePath: "assets/images/tacos-img2.jpeg",
        description:
            "Three tacos de carne asada topped with cilantro and onion",
        defaultMeat: const ["Carne Asada"],
        defaultToppings: const ["Onion", "Cilantro"],

        price: 9.99,
      ),
      MenuItem(
        forTab: MenuTab.tacos,
        label: "Al Pastor Tacos",
        imagePath: "assets/images/taco-plate.jpeg",
        description: "Three tacos al pastor topped with cilantro and onion",
        defaultMeat: ["Al Pastor"],
        defaultToppings: ["Onion", "Cilantro"],

        price: 10.99,
      ),
      MenuItem(
        forTab: MenuTab.tacos,
        label: "Deep Sea Taco Platter",
        imagePath: "assets/images/tacos-icon.jpeg",
        description:
            "Three shrimp tacos topped with cabbage and chipotle aoli sauce",
        defaultMeat: ["Shrimp"],
        defaultToppings: ["Onion", "Cilantro"],

        price: 11.99,
      ),
    ],
    MenuTab.burritos: [
      MenuItem(
        forTab: MenuTab.burritos,
        label: "Burrito de Asada",
        imagePath: "assets/images/burritos.jpeg",
        description:
            'Carne asada, black beans, rice and monterray jack cheese on a 11" tortilla',
        defaultMeat: ["Carne Asada"],
        defaultToppings: ["Rice", "Black Beans", "Monterray Jack Cheese"],

        price: 11.99,
      ),
      MenuItem(
        forTab: MenuTab.burritos,
        label: "Shrimp Burrito",
        imagePath: "assets/images/burritos-icon.jpeg",
        description:
            "Filled with shrimp, black beans, rice and chipotle aoli sauce",
        defaultMeat: ["Shrimp"],
        defaultToppings: ["Rice", "Black Beans", "Monterray Jack Cheese"],

        price: 11.99,
      ),
      MenuItem(
        forTab: MenuTab.burritos,
        label: "Breakfast Burrito",
        imagePath: "assets/images/collage3.jpeg",
        description:
            'Available until 10:30am. 11" tortilla filled with scrambled eggs, cheese and your choice of meat',
        defaultMeat: ["Carne Asada"],
        defaultToppings: ["Egg", "Monterray Jack Cheese"],
        price: 11.99,
      ),
    ],
    MenuTab.tortas: [
      MenuItem(
        forTab: MenuTab.tortas,
        label: "Al Pastor Torta",
        imagePath: "assets/images/torta-plate.jpeg",
        description:
            'Al pastor, lettuce, tomato avacado and chipotle aoli sauce on toasted fresh bread',
        defaultMeat: ["Al Pastor"],
        defaultToppings: [
          "Avacado",
          "Onion",
          "Lettuce",
          "Cabbage",
          "Chipotle Aoli Sauce",
          "Tomato",
        ],

        price: 11.99,
      ),
      MenuItem(
        forTab: MenuTab.tortas,
        label: "Carne Asada Torta",
        imagePath: "assets/images/tortas-icon.jpeg",
        description:
            'Carne asada, lettuce, tomato, avacado and chipotle aoli sauce on toasted fresh bread',
        defaultMeat: ["Carne Asada"],
        defaultToppings: [
          "Avacado",
          "Onion",
          "Lettuce",
          "Cabbage",
          "Chipotle Aoli Sauce",
          "Tomato",
        ],
        price: 11.99,
      ),
    ],
    MenuTab.quesadillas: [
      MenuItem(
        forTab: MenuTab.quesadillas,
        label: "Build your quesadilla",
        imagePath: "assets/images/quesadilla.jpg",
        description:
            '11" tortilla covered in monterray jack cheese and your choice of meat and toppings',

        defaultMeat: ["Carne Asada"],
        defaultToppings: ["Monterray Jack Cheese"],

        price: 10.99,
      ),
    ],
    MenuTab.drinks: [
      MenuItem(
        forTab: MenuTab.quesadillas,
        label: "Coke",
        imagePath: "assets/images/drink-ph.png",
        description: '',
        defaultMeat: [],
        defaultToppings: [],
        price: 2.99,
      ),
    ],
  };

  static final List<String> Meats = [
    "Carne Asada",
    "Al Pastor",
    "Chicken",
    "Shrimp",
    "No Meat",
  ];
  static final List<String> Toppings = [
    "Rice",
    "Black Beans",
    "Monterray Jack Cheese",
    "Avacado",
    "Onion",
    "Cilantro",
    "Cabbage",
    "Cucumber",
    "Tomato",
    "Chipotle Aoli Sauce",
    "Avacado Sauce",
  ];
}
