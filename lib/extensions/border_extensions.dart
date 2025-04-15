import 'package:flutter/widgets.dart';

extension BorderRadiusExtension on Widget {
  Widget roundedBorder({double radius = 5.0}) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  }
}
