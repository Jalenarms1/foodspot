import 'package:flutter/material.dart';
import 'package:foodspot/extensions/border_extensions.dart';
import 'package:foodspot/extensions/padding_ext.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/models/menu_item.dart';
import 'package:foodspot/shop_data.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/home/sidebar_menu.dart';
import 'package:foodspot/ui/screens/menu/menu_item_screen.dart';

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
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            // title: Text("Lalocura").appFontStyle(color: AppColors.darkRed),
            toolbarHeight: 350,
            flexibleSpace: Container(
              color: AppColors.appLightGrey,
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 70.0,
                      right: 30.0,
                      left: 30.0,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40, // Adjust as needed
                          child: IconButton(
                            onPressed: () {
                              _toggleSidebar();
                            },
                            icon: Icon(Icons.menu, size: 25),
                          ),
                        ),

                        // Center title
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Lalocura").appFontStyle(
                              color: AppColors.darkRed,
                              size: 20,
                              weight: FontWeight.w400,
                            ),
                            Text("Tacos Del Valle").appFontStyle(
                              color: AppColors.darkRed,
                              size: 12,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),

                        // Right icon with matching fixed width
                        SizedBox(
                          width: 40, // Match this to the left
                          child: Icon(Icons.shopping_cart_outlined, size: 25),
                        ),
                      ],
                    ).padding(edgeInsets: EdgeInsets.only(bottom: 10.0)),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30.0, left: 30.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                    child: Column(
                      spacing: 15.0,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pickup at",
                                ).appFontStyle(color: Colors.grey, size: 14),
                                Text("555 W Hills ave").appFontStyle(
                                  color: Colors.black,
                                  weight: FontWeight.w600,
                                  size: 14,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 20.0,
                            bottom: 20.0,
                            right: 40.0,
                            left: 40.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("2.0").appFontStyle(size: 14),
                                  Text(
                                    "Distance (mi)",
                                  ).appFontStyle(size: 14, color: Colors.grey),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("10-15 min").appFontStyle(size: 14),
                                  Text(
                                    "Estimated wait",
                                  ).appFontStyle(size: 14, color: Colors.grey),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).padding(edgeInsets: EdgeInsets.only(top: 20.0)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children:
                            MenuTab.values.map((tab) {
                              return menuTabWidget(
                                tab.label,
                                selectedMenuTab == tab,
                                () {
                                  setState(() {
                                    selectedMenuTab = tab;
                                  });
                                },
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // flexibleSpace: Row(children: [Icon(Icons.mail)]),
          ),
          body: Container(
            color: Colors.white,
            child: ListView(
              children:
                  ShopData.menuTabItems[selectedMenuTab]!.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MenuItemScreen(
                                key: UniqueKey(),
                                menuItem: item,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black.withValues(alpha: 0.25),
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.label).appFontStyle(
                                        weight: FontWeight.bold,
                                        size: 14,
                                      ),
                                      Container(
                                        width: 250,
                                        child: Text(
                                          item.description,
                                        ).appFontStyle(
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("\$${item.price}").appFontStyle(
                                    color: Colors.black,
                                    weight: FontWeight.w600,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset(
                                item.imagePath,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ).roundedBorder(radius: 5.0),
                            ),
                          ],
                        ).padding(edgeInsets: EdgeInsets.all(10.0)),
                      ),
                    );
                  }).toList(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.darkRed,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),

        // SidebarMenu(toggleSidebar: _toggleSidebar),
      ],
    );
  }
}

Widget menuTabWidget(String label, bool isActive, void Function() onClick) {
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: isActive ? AppColors.darkRed : Colors.transparent,
          width: 2.0,
        ),
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: TextButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        padding: WidgetStateProperty.resolveWith((states) {
          return EdgeInsets.zero;
        }),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: () {
        onClick();
      },
      child: Text(label).appFontStyle(
        size: 14,
        weight: FontWeight.w600,
        color: isActive ? AppColors.darkRed : Colors.grey,
      ),
    ),
  );
}
