// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stup/screens/mytimeline_tile.dart';
class history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('         History Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      backgroundColor: Colors.blue,
      ),
      body: 
      
      
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        
        child: ListView(
          
          children: [
SizedBox(height: 20,),
            Center(child: Text('This is your history ', style: TextStyle(fontSize: 22),)),
          //start timeline 
          MytimeLineTile(isFirst: true, isLast: false, isPast: true, child: const Text("Type : Radio de dents",style: TextStyle(fontSize: 16),),child2: Text("Date : 12/02/2021",style: TextStyle(fontSize: 16),),prix: Text('prix : 3600 DA', style: TextStyle(fontSize: 16),) , ),
          // middle timeline
          MytimeLineTile(isFirst: false, isLast: false, isPast: true,  child: const Text("Type : Radio de main", style:  TextStyle(fontSize: 16),),child2: Text("Date : 12/12/2022", style: TextStyle(fontSize: 16),), prix: Text('prix : 4500 DA', style: TextStyle(fontSize: 16),),),
          //last timeline
          MytimeLineTile(isFirst: false, isLast: false, isPast: true,  child: const Text("Type : Radio de tete", style: TextStyle(fontSize: 16),),child2: Text("Date : 23/02/2024", style: TextStyle(fontSize: 16),), prix: Text('prix : 8500 DA', style: TextStyle(fontSize: 16),),),
          MytimeLineTile(isFirst: false, isLast: true, isPast: false,  child: const Text("Type : Radio de tete", style: TextStyle(fontSize: 16),),child2: Text("Date : 17/03/2024", style: TextStyle(fontSize: 16),), prix: Text('prix : 8500 DA', style: TextStyle(fontSize: 16),),),
          ],
        ),
      ),
        
      
    );
  }
}
