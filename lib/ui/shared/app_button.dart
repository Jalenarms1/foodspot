import 'package:flutter/material.dart';
import 'package:foodspot/ui/colors.dart';

class AppButton extends StatelessWidget {
  final Color? bgColor;
  final void Function() onPressed;
  final Widget label;
  final double? elevation;

  const AppButton({
    super.key,
    this.bgColor,
    required this.onPressed,
    required this.label,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? Colors.white,
          padding: EdgeInsets.all(15.0),
          elevation: elevation ?? 1,
        ),
        child: label,
      ),
    );
  }
}
