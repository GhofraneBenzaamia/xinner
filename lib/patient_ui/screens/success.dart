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
                  letterSpacing: 2.0,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
                SizedBox(width: 2),
                Image.asset(
                  'images/doc.jpg',
                  width: 250,
                  height: 400,
                ),
              ],
            ),
            Text(
              'the doctor will verify your information ',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 4, 179, 132),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'and notify you shortly',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 4, 179, 132),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20),
                splashColor: Colors.blue,
                minWidth: 40,
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "Done",
                  style: TextStyle(
                      backgroundColor: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
            /* SizedBox(width: 20, height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 4, 135, 242),
                ),
                child: Center(
                  child: Text(
                    'Done',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ), */
          ],
        ),
      )),
    );
  }
}
