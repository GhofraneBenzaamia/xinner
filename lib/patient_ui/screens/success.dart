// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class success extends StatefulWidget {
  static const String frm = "success";
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Finish',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Appointment added successfully',
                style: TextStyle(
                  letterSpacing:
                      screenWidth * 0.005, // Adjust the factor as needed
                  fontSize: screenWidth * 0.05, // Adjust the factor as needed

                  fontWeight: FontWeight.bold,
                )),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          screenWidth * 0.07), // Adjust the factor as needed

                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: screenWidth * 0.2, // Adjust the factor as needed
                  ),
                ),
                SizedBox(
                    width: screenWidth * 0.004), // Adjust the factor as needed
                Image.asset(
                  'images/doc.jpg',
                  width: screenWidth * 0.6, // 31.25% of the screen width
                  height: screenHeight * 0.5, // 62.5% of the screen height
                ),
              ],
            ),
            Text(
              'the doctor will verify your information ',
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Color.fromARGB(255, 4, 179, 132),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'and notify you shortly',
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Color.fromARGB(255, 4, 179, 132),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.05625, // 5.625% of the screen height
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                splashColor: Colors.blue,
                minWidth: screenWidth * 0.1,
                height: screenHeight * 0.06,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "Done",
                  style: TextStyle(
                      backgroundColor: Colors.blue,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
