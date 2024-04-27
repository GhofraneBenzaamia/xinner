// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});
  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05), // Adjust the factor as needed
      child: Container(
        height: screenHeight * 0.055, // Adjust the factor as needed
        padding:
            EdgeInsets.all(screenWidth * 0.025), // Adjust the factor as needed

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF106163),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              'Done',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
