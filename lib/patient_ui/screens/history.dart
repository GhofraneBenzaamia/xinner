import 'package:flutter/material.dart';


class history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Screen'),
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Center(
        child: Text('Ceci est votre historique'),
      ),
    );
  }
}