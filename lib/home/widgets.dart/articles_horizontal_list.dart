import 'package:flutter/material.dart';

class ArticlesHorizontalList extends StatelessWidget {
  const ArticlesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          serviceItem(
              picture: 'assests/images/ph.jpeg',
              date: "01 January 2023",
              text: "this is what you should do before your appointment"),
          serviceItem(
              picture: 'assests/images/ph.jpeg',
              date: "01 January 2023",
              text: "this is what you should do before your appointment"),
        ],
      ),
    );
  }

  Widget serviceItem(
      {required String picture, required String text, required String date}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 280,
              height: 130,
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}
