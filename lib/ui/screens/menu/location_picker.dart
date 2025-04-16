import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodspot/extensions/padding_ext.dart';
import 'package:foodspot/extensions/text_extensions.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.0,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pickup at").appFontStyle(color: Colors.grey, size: 14),
                Text("555 W Hills ave").appFontStyle(
                  color: Colors.black,
                  weight: FontWeight.w600,
                  size: 14,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down)),
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
    ).padding(edgeInsets: EdgeInsets.only(top: 20.0));
  }
}
