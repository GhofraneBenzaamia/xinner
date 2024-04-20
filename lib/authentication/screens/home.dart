// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = const Color(0xFF106163);
  //double userHeight = THelperFunctions.screenHeight()*0.2;

  @override
  Widget build(BuildContext context) {
    UserNameImage userInfos = UserNameImage(
        userName: "yousra", userImage: "assets/images/photo.jpeg");

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 140),
            child: ListView(
              children: [
                Container(
                  child: appoiText(),
                ),

                const SizedBox(height: 17),

                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(133, 9, 122, 120),
                      //color:Colors.pink[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(children: [
                        Container(
                          child: conf(),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          child: dateTime(),
                        ),
                      ]),
                    ),
                  ),
                ),

                const SizedBox(height: 17),
                Container(
                  //                       #Categories Text
                  child: categoryText(),
                ),

                const SizedBox(height: 17),

                Container(
                    //                          #Categories

                    height: 220,
                    margin: const EdgeInsets.only(
                        //top: 10,
                        ),
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      const SizedBox(width: 18),
                      category('assets/images/Xray.jpeg', "x-ray"),
                      const SizedBox(width: 18),
                      category('assets/images/Eco.jpeg', "ecography"),
                      const SizedBox(width: 18),
                      category('assets/images/Mammo.jpeg', "mammography"),
                      const SizedBox(width: 18),
                      category('assets/images/Ct.jpg', "ct"),
                      const SizedBox(width: 18),
                      category('assets/images/irm.jpeg', "irm"),
                      const SizedBox(width: 18),
                    ])),

                Container(
                  //                       #Articles Text
                  child: articlesText(),
                ),

                const SizedBox(height: 17),

                Container(
                  //                          #Articles
                  height: 220,
                  margin: const EdgeInsets.only(
                      //top: 10,
                      ),
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    const SizedBox(width: 18),
                    article("this is what you should do before your appointment",
                        "1 January 2023", 'assets/images/ph.jpeg'),
                    const SizedBox(width: 18),
                    article("what are the dangers of irm?", "1 January 2023",
                        'assets/images/mammo.jpeg'),
                    const SizedBox(width: 18),
                  ]),
                ),

                const SizedBox(height: 20), //                #space between
              ],
            ),
          ),
          TopHomePage(
            userInfos: userInfos,
          )
        ],
      ),
    );
  }

  Container article(String title, String date, String photo) {
    return Container(
      //color:Colors.grey,
      //decoration: BoxDecoration(),
      decoration: const BoxDecoration(
          //color: Colors.grey[100],
          // borderRadius: BorderRadius.circular(10),
          ),
      height: 200,
      width: 280,
      child: Column(
        children: [
          articlePhoto(photo),
          const SizedBox(height: 10),
          articleTitle(title),
          const SizedBox(height: 5),
          articleDate(date),
        ],
      ),
    );
  }

  Container articleDate(String date) {
    return Container(
      width: 280,
      child: Text(
        date,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Container articleTitle(String title) {
    return Container(
      width: 280,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Container articlePhoto(String photo) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: 280,
      height: 130,
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        photo,
        fit: BoxFit.cover,
      ),
    );
  }

  Padding articlesText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          child: const Text(
        "Articles",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 23,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        ),
      )),
    );
  }

  Padding appoiText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          child: const Text(
        "Your upcoming appointment",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 23,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        ),
      )),
    );
  }

  Container category(String photo, String categ) {
    return Container(
      width: 180,
      //height: 200,
      decoration: const BoxDecoration(),
      child: Column(children: [
        catPhoto(photo),
        catText(categ),
      ]),
    );
  }

  Container catText(String categ) {
    return Container(
        //       #text
        margin: const EdgeInsets.only(top: 7),
        //height: 30,
        child: Text(
          categ,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ));
  }

  Container catPhoto(String photo) {
    return Container(
      //       #photo
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: 180,
      height: 155,
      child: Image.asset(
        photo,
        fit: BoxFit.cover,
      ),
    );
  }

  Padding categoryText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          child: const Text(
        "Our services",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 23,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        ),
      )),
    );
  }

  Container conf() {
    return Container(
      //height: 40,
      decoration: const BoxDecoration(
          //color: Colors.green[600],
          //borderRadius: BorderRadius.circular(5),
          ),
      child: const Center(
        child: Text(
          //textAlign: TextAlign.center,

          " ✅️ Confirmed appointment ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            //fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }

  Container dateTime() {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        //border:Border.all(width:2),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Row(children: [
              Icon(Icons.calendar_month, color: Color(0xFF106163)),
              Text(
                textAlign: TextAlign.center,
                "Mon,20 Feb",
                style: TextStyle(
                  color: Color(0xFF106163),
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Container(
            color: const Color(0xFF106163),
            width: 0.5,
            height: 36,
            margin: const EdgeInsets.only(right: 3),
          ),
          const Expanded(
            child: Row(children: [
              Icon(Icons.access_time, color: Color(0xFF106163)),
              Text(
                textAlign: TextAlign.center,
                "10.00 AM",
                style: TextStyle(
                  color: Color(0xFF106163),
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Container(
            color: const Color(0xFF106163),
            width: 0.5,
            height: 36,
            margin: const EdgeInsets.only(right: 3),
          ),
          const Expanded(
            child: Row(children: [
              Icon(Icons.people, color: Color(0xFF106163)),
              Text(
                textAlign: TextAlign.center,
                "8 patients",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF106163),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

/*class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    path.lineTo(0, h-50);
    //path.lineTo(w, h);
    path.quadraticBezierTo(w * 0.5, h , w, h-50);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}*/
/*

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}*/
}

class AppointmentDetails extends StatelessWidget {
  final AppoiSituation appSit;

  const AppointmentDetails({super.key, required this.appSit});

  @override
  Widget build(BuildContext context) {
    Container? appoiBox;

    if (appSit.appoState == "confirmed") {
      appoiBox = confirmedAppoi(appSit.date,appSit.time,appSit.patientsNumBefore,appSit.indications,appSit.price);
    } else if (appSit.appoState == "pending") {
      appoiBox = pendingAppoi();
    } else if (appSit.appoState == "noAppointment") {
      appoiBox = noBookedAppoi();
    } else if (appSit.appoState == "resultReady") {
      appoiBox = resultAppoiRaady();
    }
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(133, 9, 122, 120),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Container(
              child: appoiBox,
            ),
            const SizedBox(height: 12),
            Container(
              child: dateTime(),
            ),
          ]),
        ),
      ),
    );
  }

  Container confirmedAppoi(String date,String time,int patientsNumBefore,String indications,int price) {
    return Container(
      //height: 40,
      decoration: const BoxDecoration(
          //color: Colors.green[600],
          //borderRadius: BorderRadius.circular(5),
          ),
      child: const Center(
        child: Text(
          //textAlign: TextAlign.center,

          " ✅️ Confirmed appointment ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            //fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }

  Container pendingAppoi() {
    return Container();
  }

  Container refusedAppoi() {
    return Container();
  }

  Container noBookedAppoi() {
    return Container();
  }

  Container dateTime() {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        //border:Border.all(width:2),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Row(children: [
              Icon(Icons.calendar_month, color: Color(0xFF106163)),
              Text(
                textAlign: TextAlign.center,
                "Mon,20 Feb",
                style: TextStyle(
                  color: Color(0xFF106163),
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Container(
            color: const Color(0xFF106163),
            width: 0.5,
            height: 36,
            margin: const EdgeInsets.only(right: 3),
          ),
          const Expanded(
            child: Row(children: [
              Icon(Icons.access_time, color: Color(0xFF106163)),
              Text(
                textAlign: TextAlign.center,
                "10.00 AM",
                style: TextStyle(
                  color: Color(0xFF106163),
                  fontSize: 12,
                ),
              ),
            ]),
          ),
          Container(
            color: const Color(0xFF106163),
            width: 0.5,
            height: 36,
            margin: const EdgeInsets.only(right: 3),
          ),
          const Expanded(
            child: Row(children: [
              Icon(Icons.people, color: Color(0xFF106163)),
              Text(
                textAlign: TextAlign.center,
                "8 patients",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF106163),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container resultAppoiRaady() {
    return Container();
  }
}

class AppoiSituation {
  // final bool isBooked;
  //final bool isValid;
  final String appoState;
  final String indications;
  final String rejectionReason;
  final int price;
  final String date;
  final String time;
  final int patientsNumBefore;
  // final bool isResultReady;

  AppoiSituation(
    //this.isBooked,
    //this.isValid,
    this.appoState,
    this.date,
    this.time,
    this.patientsNumBefore,
    //this.isResultReady,
    this.price,
    this.indications,
    this.rejectionReason,
  );
}
class TopHomePage extends StatelessWidget {

  final UserNameImage userInfos;

  const TopHomePage({super.key, required this.userInfos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 150,
      child: Container(
        child: topPage(),
      ),
    );
  }

  Row topPage() {
    return Row(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    helloUser(userInfos.userName),
                    userMessage(),
                  ]),
            ),
          ),
        ),

        userImage(userInfos.userImage),
      ],
    );
    // ),
    // );
  }

  Expanded userImage(String image) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 25, top: 30),
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }

  Text userMessage({String message = "stay healthy, with radioApp!"}) {
    return Text(
      message,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  Text helloUser(String userName) {
    return Text(
      "Hello,$userName 👋️",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
class UserNameImage {
  final String userName;
  final String userImage;

  UserNameImage({
    required this.userName,
    required this.userImage,
  });
}
