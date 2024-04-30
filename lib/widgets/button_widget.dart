// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:xinner/utils/constants/my_constants.dart';

class Button extends StatelessWidget {
  final String text;
  final double height;
  final Function() onTap;
  final EdgeInsets margin, padding;
  final Color textColor, splashColor;
  final Color? backGroundColor;
  final double radius, elevation;
  final double? width;
  final double? textSize;
  final FontWeight fontWeight;
  final bool secondaryBackground;
  bool outline = false;

  Button({
    required this.text,
    this.height = 70,
    this.width,
    this.splashColor = kSecondaryColor,
    required this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.textColor = Colors.white,
    this.backGroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    this.radius = kRadius,
    this.elevation = 2,
    this.fontWeight = FontWeight.w600,
    this.secondaryBackground = false,
    this.textSize = 16,
  });

  Button.outline({
    required this.text,
    this.height = 50,
    this.width,
    this.splashColor = kPrimaryColor,
    required this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.textColor = kSecondaryColor,
    this.backGroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    this.radius = kRadius,
    this.elevation = 2,
    this.fontWeight = FontWeight.w600,
    this.secondaryBackground = false,
    this.textSize = 16,
  }) {
    outline = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: elevation,
        color: backGroundColor,
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: InkWell(
            splashColor: splashColor,
            onTap: onTap,
            borderRadius: BorderRadius.circular(radius),
            child: Container(
              height: height,
              width: width ?? width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                    color: outline ? kSecondaryColor : Colors.transparent),
              ),
              margin: margin,
              padding: padding,
              alignment: Alignment.center,
              child: Text(
                text.tr,
                style: TextStyle(
                    fontSize: textSize!,
                    color: textColor,
                    fontWeight: fontWeight),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
