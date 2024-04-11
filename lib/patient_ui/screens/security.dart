// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class security extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Screen '),
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      // ignore: prefer_const_constructors
      body: Center(
        child: Text('Security'),
      ),
    );
  }
}