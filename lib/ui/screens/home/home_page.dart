import 'package:flutter/material.dart';
import 'package:foodspot/extensions/border_extensions.dart';
import 'package:foodspot/extensions/padding_ext.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/managers/cart_notifier.dart';
import 'package:foodspot/models/menu_item.dart';
import 'package:foodspot/shop_data.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/home/sidebar_menu.dart';
import 'package:foodspot/ui/screens/menu/location_picker.dart';
import 'package:foodspot/ui/screens/menu/menu_item_list.dart';
import 'package:foodspot/ui/screens/menu/menu_item_screen.dart';
import 'package:foodspot/ui/screens/menu/menu_tab_list.dart';
import 'package:foodspot/ui/shared/app_app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  MenuTab selectedMenuTab = MenuTab.tacos;
  bool _isSidebarOpen = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = Provider.of<CartNotifier>(context);

    return Stack(
      children: [
        Scaffold(
          appBar: appAppBar(),
          body: Column(
            children: [
              Container(
                color: AppColors.appLightGrey,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 30.0, left: 30.0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      child: LocationPicker(),
                    ),
                    MenuTabList(
                      onSelect: (MenuTab tab) {
                        setState(() {
                          selectedMenuTab = tab;
                        });
                      },
                      selectedMenuTab: selectedMenuTab,
                    ),
                  ],
                ),
              ),
              MenuItemList(selectedMenuTab: selectedMenuTab),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.darkRed,
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_membership),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.shopping_cart_checkout),
                    if (cartNotifier.numOfItems > 0)
                      Positioned(
                        top: -10,
                        right: -10,
                        child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Text(
                            "${cartNotifier.numOfItems}",
                          ).appFontStyle(
                            size: 12,
                            color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),

        // SidebarMenu(toggleSidebar: _toggleSidebar),
      ],
    );
  }
}
