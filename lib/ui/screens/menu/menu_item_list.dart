import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodspot/extensions/border_extensions.dart';
import 'package:foodspot/extensions/padding_ext.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/models/menu_item.dart';
import 'package:foodspot/shop_data.dart';
import 'package:foodspot/ui/screens/menu/menu_item_screen.dart';

class MenuItemList extends StatelessWidget {
  final MenuTab selectedMenuTab;
  const MenuItemList({super.key, required this.selectedMenuTab});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ...ShopData.menuTabItems[selectedMenuTab]!.map((item) {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.label).appFontStyle(
                                    weight: FontWeight.bold,
                                    size: 14,
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(item.description).appFontStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
