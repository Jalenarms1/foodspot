import 'package:flutter/material.dart';
import 'package:foodspot/extensions/text_extensions.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/shared/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // title: Text("Lalocura").appFontStyle(color: AppColors.darkRed),
          // toolbarHeight: 80,
          flexibleSpace: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
              top: 30.0,
              left: 15.0,
              right: 15.0,
              bottom: 10.0,
            ),
            width: double.infinity,
            height: 115,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.025),
                  blurRadius: 2.0,
                  spreadRadius: 5.0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              spacing: 20,
              children: [
                Expanded(
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.pin_drop, size: 20, color: Colors.red),
                      Text("Find a location").appFontStyle(
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                Icon(Icons.account_box, size: 30, color: AppColors.darkRed),
              ],
            ),
          ),
          // flexibleSpace: Row(children: [Icon(Icons.mail)]),
        ),
        bottomNavigationBar: Container(
          color: Colors.black.withValues(alpha: 0.025),
          child: TabBar(
            splashFactory: NoSplash.splashFactory,
            indicator: BoxDecoration(),
            labelColor: AppColors.darkRed,
            unselectedLabelColor: Colors.black.withValues(alpha: 0.45),
            tabs: [
              Tab(text: "Home", icon: Icon(Icons.house)),
              Tab(text: "Profile", icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              AppButton(
                onPressed: () {},
                label: Text("Order now").appFontStyle(color: Colors.white),
                bgColor: AppColors.darkRed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
