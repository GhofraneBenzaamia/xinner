import 'package:flutter/material.dart';



class InformationAssistant extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InformationAssistantState();
}

class _InformationAssistantState extends State<InformationAssistant> {
  final TextEditingController _tController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff106163),
        title: Center(
          child: Text(
            'About patient',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
        elevation: 9,
      ),
      body: Padding(
        padding: EdgeInsets.all(22),
        child: ListView(
          children: [
            _spaceBet(),
            Row(
              children: [
                _photo(),
                _fullName(),
              ],
            ),
            _spaceBetween(),
            _phoneNumber("07777777777"),
            _spaceBetween(),
            _time("20:00"),
            _spaceBetween(),
            _price("200"),
            _spaceBetween(),
            _emergency("non"),
            _spaceBetween(),
           
           
            _spaceBetween(),
        
            _timeNeeded(),

           
            _spaceBetween(),
            _spaceBetween(),
            _spaceBetween(),
            _spaceBetween(),
            _spaceBetween(),
            _spaceBetween(),
            _spaceBetween(),
            _spaceBetween(),
            SizedBox(height: 16), // Adjust as needed for spacing
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('OK'),
            ),
          ),
            
          ],
        ),
        
      ),
    );
  }
  Align _timeNeeded() {
  return Align(
    alignment: Alignment.centerLeft,
    
      child: Container(
        width: 300,
        height: 35,
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


  Container _photo() {
    return Container(
      width: 70,
      child: _userImage("assests/images/patient.jpg"),
    );
  }

  Align _userImage(String image) {
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

  Expanded _fullName() {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: _infoC("\tfull name", "hafs zerrouki", 190),
      ),
    );
  }

  Column _infoC(String title, String content, double w) {
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
            "\t$content",
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

  SizedBox _spaceBetween() {
    return SizedBox(height: 23);
  }
  SizedBox _spaceBet() {
    return SizedBox(height: 13);
  }

  Container _time(String time) {
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
            _infoC("time", time, 200),
          ],
        ),
      ),
    );
  }

  Container _price(String price) {
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
            _infoC("price", price, 200),
          ],
        ),
      ),
    );
  }

  Container _phoneNumber(String phone) {
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
            _infoC("phone number", phone, 200),
          ],
        ),
      ),
    );
  }

  Container _documents() {
    return Container(
      height: 45,
      width: 225,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff106163),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              Icons.download,
              size: 30,
              color: Color(0xff106163),
            ),
            Text(
              "\tAppointment Details",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff106163),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _emergency(String emergency) {
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
            _infoC("emergency", emergency, 200),
          ],
        ),
      ),
    );
  }
}
