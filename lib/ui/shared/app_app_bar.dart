import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodspot/extensions/padding_ext.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/ui/colors.dart';

AppBar appAppBar() {
  return AppBar(
    // title: Text("Lalocura").appFontStyle(color: AppColors.darkRed),
    backgroundColor: AppColors.darkRed,
    toolbarHeight: 70,
    flexibleSpace: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // padding: EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                "assets/images/lalocura-logo.jpeg",
                width: 45,
                height: 45,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("LALOCURA").appFontStyle(
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.w600,
                ),
                Text("Tacos Del Valle").appFontStyle(
                  color: AppColors.appLightGrey,
                  size: 12,
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ).padding(edgeInsets: EdgeInsets.only(bottom: 10.0, left: 10)),
      ),
    ),
  );
}
