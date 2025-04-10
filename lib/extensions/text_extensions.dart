import 'package:flutter/material.dart';

extension CustomTextStyle on Text {
  Text appFontStyle({
    Color? color,
    double? size,
    FontWeight? weight,
    TextAlign? textAlign,
  }) {
    if (data == null) return this;
    return Text(
      data!,
      style: TextStyle(
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? Colors.black,
        fontSize: size ?? 16,
        decoration: TextDecoration.none,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
