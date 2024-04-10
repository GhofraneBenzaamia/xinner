import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final child;
  final child2;
  final prix;
  const EventCard({
    super.key,
   required this.isPast,
   required this.child,
   required this.child2,
   required this.prix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    
      margin: EdgeInsets.all(15),
       padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.blue[100],
      borderRadius: BorderRadius.circular(8),
      ),
     // child: Text("hola"),
    // child: child,
    //  alignment: Alignment.centerLeft, // Or other alignment as needed
    child: Expanded(
      child: Column(
        children: [
          SizedBox(height: 5,),
         child2,
         SizedBox(height: 8,),
          SizedBox(width: 8,),
           child,
           SizedBox(height: 8,),
          prix,
       SizedBox(height: 8,),
      
        ],
      ),
    ) ,
    );
  }
}