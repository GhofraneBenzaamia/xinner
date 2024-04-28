import 'package:flutter/material.dart';

class ServicesHorizontalList extends StatelessWidget {
  const ServicesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          serviceItem(picture: 'assests/images/xray.jpeg', text: "x-ray"),
          serviceItem(picture: 'assests/images/irm.jpeg', text: "irm"),
          serviceItem(picture: 'assests/images/Eco.jpeg', text: "ecography"),
          serviceItem(
              picture: 'assests/images/Mammo.jpeg', text: "mammography"),
          serviceItem(picture: 'assests/images/Ct.jpg', text: "ct"),
        ],
      ),
    );
  }

  Widget serviceItem({required String picture, required String text}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 180,
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: 180,
            height: 155,
            child: Image.asset(
              picture,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          )
        ],
      ),
    );
  }
}
