import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double kHorizontalPadding = 12;
const double kVerticalPadding = 15;
const double kRadius = 15;
const Color kSecondaryColor = Colors.blue;
const Color kPrimaryColor = Color.fromRGBO(0, 121, 62, 1);
BoxDecoration kButtonBoxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(.6),
      offset: const Offset(0, 1.5),
      blurRadius: 4,
    )
  ],
  color: Colors.white,
  borderRadius: BorderRadius.circular(kRadius),
);
