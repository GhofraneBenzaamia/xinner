import 'package:flutter/material.dart';
import 'package:stup/screens/TCollors.dart';
import 'package:stup/screens/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';
class MytimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget child;
  final Widget child2;
  final Widget prix;
 // final eventCard;
   const MytimeLineTile({
    super.key,
  required this.isFirst,
  required this.isLast,
  required this.isPast,
  required this.child,
  required this.child2,
  required this.prix,
 // required this.eventCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        //decoration the lines
        beforeLineStyle: LineStyle(color: TColors.primary,
        
          ),
        //decoration the icons
        indicatorStyle: IndicatorStyle(
          width: 40,
          
          color: TColors.primary,
          iconStyle: IconStyle(iconData: Icons.done ,
          color: Colors.white,
          ),
      
        ),
        //event card 
        endChild: EventCard(
        isPast: isPast,
        child: child,
        
        child2:child2,
        prix: prix,
        ),
      ),
    );
  }
}