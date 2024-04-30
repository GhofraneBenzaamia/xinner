// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatefulWidget {
  static const String frm = "success";
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Successful',
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Appointment added successfully',
              style: TextStyle(
                // Adjust the factor as needed
                fontSize: 20, // Adjust the factor as needed

                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * 0.07), // Adjust the factor as needed

                child: Icon(
                  Icons.check_circle,
                  color: Color(0xFF106163),
                  size: 80, // Adjust the factor as needed
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'the doctor will verify your information ',
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 4, 179, 132),
                fontWeight: FontWeight.bold),
          ),
          Text(
            'and notify you shortly',
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 4, 179, 132),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenHeight * 0.05625, // 5.625% of the screen height
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: MaterialButton(
              onPressed: () {
                Get.back();
              },
              color: Color(0xFF106163),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              splashColor: Color(0xFF106163),
              minWidth: screenWidth * 0.1,
              height: screenHeight * 0.06,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
