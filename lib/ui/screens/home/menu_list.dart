import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodspot/ui/colors.dart';

const menuOpts = ["Tacos", "Burritos", "Tortas", "Quesadilla", "Drinks"];
const menuOptsPrice = ["2.99ea", "9.99", "11.99", "11.99", ""];
const menuOptImgs = [
  "assets/images/tacos-icon.jpeg",
  "assets/images/burritos-icon.jpeg",
  "assets/images/tortas-icon.jpeg",
  "assets/images/quesadilla.jpg",
  Icon(Icons.local_drink_sharp),
];

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: menuOpts.length,
      itemBuilder: (context, index) {
        final menuAsset = menuOptImgs[index];

        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.darkRed.withValues(alpha: 0.95),
                width: 0.5,
              ),
            ),
          ),
          padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 10,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  if (menuAsset is String)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        menuAsset,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    )
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.white.withValues(alpha: 0.15),
                        child: Icon(Icons.coffee, color: Colors.white),
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuOpts[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        menuOptsPrice[index],
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
