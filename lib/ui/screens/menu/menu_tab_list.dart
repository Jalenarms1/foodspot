import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/models/menu_item.dart';
import 'package:foodspot/ui/colors.dart';

class MenuTabList extends StatefulWidget {
  MenuTab selectedMenuTab;
  void Function(MenuTab tab) onSelect;
  MenuTabList({
    super.key,
    required this.onSelect,
    required this.selectedMenuTab,
  });

  @override
  State<MenuTabList> createState() => _MenuTabListState();
}

class _MenuTabListState extends State<MenuTabList> {
  @override
  Widget build(BuildContext context) {
    return Align(
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
                  widget.selectedMenuTab == tab,
                  () {
                    widget.onSelect(tab);
                  },
                );
              }).toList(),
        ),
      ),
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
