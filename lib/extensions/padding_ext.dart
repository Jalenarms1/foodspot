import 'package:flutter/material.dart';

extension PaddingExt on Widget {
  Widget padding({EdgeInsets edgeInsets = const EdgeInsets.all(10.0)}) {
    return Padding(padding: edgeInsets, child: this);
  }
}
