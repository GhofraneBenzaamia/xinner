import 'package:flutter/material.dart';


class AboutPatient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPatientState();
}
class _AboutPatientState extends State<AboutPatient> {
final TextEditingController _tController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    InformationsA infos = InformationsA(
        fullname: "hafsa zerrouki",
        phoneNumber: "0788282888",
        price: "200DA",
        date: "20_05_2024",
        time: "20:20",
        emergency: "NON",
        );
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: EdgeInsets.only(right: 22, left: 22),
        child: ListView(children: [
          spaceBetween(),
          InformationsUiA(
              infos: infos,
              userImage:"assests/images/photo1.jpeg"
          ), 
         message(),
         spaceBetween(),
         spaceBetween(),
         spaceBetween(),
         spaceBetween(),
         spaceBetween(),
         Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('OK'),
            ),
          ),

        ]),
      ),
    );
  }
  PreferredSize appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(75),
      child: AppBar(
        backgroundColor: Color(0xff106163),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
          color: Colors.white,
          onPressed: () {},
        ),
        title: const Text(
          textAlign: TextAlign.center,
          'About patient',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
        //  elevation: 9,
      ),
    );
  }
  SizedBox spaceBetween() {
    return SizedBox(height: 23);
  }

  Align message() {
  return Align(
    alignment: Alignment.centerLeft,
    
      child: Container(
        width: 400,
        height: 45,
        child: TextField(
          controller: _tController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            labelText: 'set a message',
            labelStyle: TextStyle(
              fontSize: 18,
              color: Color(0xff106163),
            ),
          ),
        ),
      ),
    );
  
}
  }
class InformationsA {
  late String fullname;
  final String phoneNumber;
  final String time;
  final String price;
  final String date; 
  final String emergency; 
  

  InformationsA({
    required this.fullname,
    required this.phoneNumber,
    required this.time,
    required this.price,
    required this.date,
    required this.emergency,
    
  });
}
class InformationsUiA extends StatelessWidget {
  final String userImage;
  final InformationsA infos;
  const InformationsUiA({
    super.key,
    required this.infos,
    required this.userImage,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            photo(userImage),
            fullName(infos.fullname),
          ],
        ),
        SizedBox(height: 32),
        //spaceBetween(),
        phoneNumber(infos.phoneNumber),
        spaceBetween(),
        price(infos.price),
        spaceBetween(),
        date(infos.date),
        spaceBetween(),
        time(infos.time),
        spaceBetween(),
        emergency(infos.emergency),
        spaceBetween(),
        
      ],
    );
  }
  Container photo(String userImage) {
    return Container(
      width: 70,
      child: userImageCircle(userImage),
    );
  }
  SizedBox spaceBetween() {
    return SizedBox(height: 23);
  }

Expanded fullName(String fullName) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: infoC("full name", fullName, 190),
      ),
    );
  }
  Align userImageCircle(
    String image,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipOval(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 55,
          height: 55,
        ),
      ),
    );
  }
  Column infoC(String title, String content, double w) {
    return Column(
      children: [
        Container(
          width: w,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: w,
          child: Text(
            content,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }

 Container time(String time) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.access_time,
                size: 35,
                color: Color(0xff106163),
              ),
            ),
            SizedBox(width: 11),
            infoC("time", time, 200),
          ],
        ),
      ),
    );
  }

  Container price(String price) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.attach_money,
                size: 35,
                color: Color(0xff106163),
              ),
            ),
            SizedBox(width: 11),
            infoC("price", price, 200),
          ],
        ),
      ),
    );
  }

  Container phoneNumber(String phone) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.phone,
                size: 35,
                color: Color(0xff106163),
              ),
            ),
            SizedBox(width: 11),
           infoC("phone number", phone, 200),
          ],
        ),
      ),
    );
  }

  Container emergency(String emergency) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.warning,
                size: 35,
                color: Color(0xff106163),
              ),
            ),
            SizedBox(width: 11),
            infoC("emergency", emergency, 200),
          ],
        ),
      ),
    );
  }
  Container date(String emergency) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.calendar_month,
                size: 35,
                color: Color(0xff106163),
              ),
            ),
            SizedBox(width: 11),
            infoC("date", emergency, 200),
          ],
        ),
      ),
    );
  }
  
  












  }
  
 
