// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, file_names, prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

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
    /*GET USERNAME AND IMAGE HERE*/
    UserNameImage userInfos = UserNameImage(
        userName: "yousra", userImage: "assests/images/photo.jpeg");

/*GET APPOINTMENT DETAILS FROM APPOINTMENT COLLECTION*/

    AppoiSituation appSit = AppoiSituation(
      appoState: "confirmed",
      /*noAppointment,pending,confirmed,refused,resultReady*/
      date: "20 jan",
      time: "10 am",
      patientsNumBefore: 3,
      price: 2000,
      indications: "you should come fasting",
      rejectionReason: "manque du dossier médical",
    );

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
                AppointmentDetails(
                  appSit: appSit,
                ),

/*
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
*/
                const SizedBox(height: 17),
                Container(
                  //                       #Categories Text
                  child: categoryText(),
                ),

                const SizedBox(height: 17),

                Container(
                    //                          #Categories

                    height: 220,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      const SizedBox(width: 18),
                      category('assests/images/xray.jpeg', "x-ray"),
                      const SizedBox(width: 18),
                      category('assests/images/irm.jpeg', "irm"),
                      const SizedBox(width: 18),
                      category('assests/images/Eco.jpeg', "ecography"),
                      const SizedBox(width: 18),
                      category('assests/images/Mammo.jpeg', "mammography"),
                      const SizedBox(width: 18),
                      category('assests/images/Ct.jpg', "ct"),
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
                    article(
                        "this is what you should do before your appointment",
                        "1 January 2023",
                        'assests/images/ph.jpeg'),
                    const SizedBox(width: 18),
                    article("what are the dangers of irm?", "1 January 2023",
                        'assests/images/mammo.jpeg'),
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
/*
class AppointmentDetails extends StatelessWidget {
  final AppoiSituation appSit;

  const AppointmentDetails({super.key, required this.appSit});

  @override
  Widget build(BuildContext context) {
    Container? appoiBox;

    if (appSit.appoState == "confirmed") {
      appoiBox = confirmedAppoi(appSit.date, appSit.time,
          appSit.patientsNumBefore, appSit.indications, appSit.price);
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
          ]),
        ),
      ),
    );
  }
*/

class AppointmentDetails extends StatefulWidget {
  final AppoiSituation appSit;

  const AppointmentDetails({Key? key, required this.appSit}) : super(key: key);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  late Container appoiBox;
  late Color containerColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(AppointmentDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _updateAppointmentDetails() {
    switch (widget.appSit.appoState) {
      // case "confirmed":
      //   appoiBox = confirmedAppoi(
      //     widget.appSit.date ?? '',
      //     widget.appSit.time ?? '',
      //     widget.appSit.patientsNumBefore ?? 0,
      //     widget.appSit.indications ?? '',
      //     widget.appSit.price ?? 0,
      //   );
      // containerColor = Color(0xFF106163).withOpacity(0.9);
      // break;
      case "pending":
        appoiBox = pendingAppoi();
        containerColor = Colors.orange.withOpacity(0.65);
        break;
      case "noAppointment":
        appoiBox = noBookedAppoi();
        containerColor = Colors.grey;
        break;
      case "resultReady":
        appoiBox = resultAppoiRaady();
        containerColor = Colors.green.withOpacity(0.9);
        break;
      case "refused":
        appoiBox = refusedAppoi(widget.appSit.rejectionReason ?? '');
        containerColor = Colors.red.withOpacity(0.8);
        break;
      default:
        appoiBox = Container(); // Default to an empty container
        containerColor = Colors.transparent;
    }
  }

/*
  void _updateAppointmentDetails() {
    switch (widget.appSit.appoState) {
      case "confirmed": //date time people price indications (add icon to go to price&indicatins details page)
        appoiBox = confirmedAppoi(
          widget.appSit.date,
          widget.appSit.time,
          widget.appSit.patientsNumBefore,
          widget.appSit.indications,
          widget.appSit.price,
        );
        containerColor = Color(0xFF106163).withOpacity(0.9);
        break;
      case "pending": //no other infos
        appoiBox = pendingAppoi();
        containerColor = Colors.orange.withOpacity(0.65);
        break;
      case "noAppointment": //no other infos
        appoiBox = noBookedAppoi();
        containerColor = Colors.grey;
        break;
      case "resultReady": //no other infos
        appoiBox = resultAppoiRaady();
       containerColor = Colors.green.withOpacity(0.9);
       //containerColor = Color(0xFF106163).withOpacity(0.9);
        break;
      case "refused": //reason of rejection! (add icon to go to reason of rejection page) DONE
        appoiBox = refusedAppoi(widget.appSit.rejectionReason);
        containerColor = Colors.red.withOpacity(0.8);
        break;
      default:
        appoiBox = Container(); // Default to an empty container
        containerColor = Colors.transparent;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            child: appoiBox,
          ),
        ),
      ),
    );
  }

/*
  Container confirmedAppoi(String date, String time, int patientsNumBefore,
      String indications, int price) {
    return Container(
      child: Column(
        children: [
          Container(
            //height: 40,
            decoration: const BoxDecoration(
                //color: Colors.green[600],
                //borderRadius: BorderRadius.circular(5),
                ),
            child: const Center(
              child: Text(
                //textAlign: TextAlign.center,

                " 📅️ Confirmed appointment ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  //fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            child: dateTime(date, time, patientsNumBefore.toString()),
          ),
        ],
      ),
    );
  }
*/

  Container pendingAppoi() {
    return Container(
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "⏳️ Pending appointment ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            textAlign: TextAlign.center,
            "your request is pending to be confirmed in a little while!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

/*
  Container refusedAppoi(String reasonRejection) {
           return      Container(
              child:Column(children:[
               Text(
                textAlign: TextAlign.center,

                "Refused appointment ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height:10),
              Text(
               textAlign: TextAlign.center,

                "your request was refused, see more details by clicking on the icon above ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              ],
              ),
          );
  }
*/
  Container refusedAppoi(String reasonRejection) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Refused appointment",
                // textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RejectionReasonPage(reason: reasonRejection),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Your request was refused, see more details by clicking on the icon above!",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Container noBookedAppoi() {
    return Container(
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "No booked appointment ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 25),
          Text(
            textAlign: TextAlign.center,
            "feel free to schedule one below ➕️ ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Container resultAppoiRaady() {
    return Container(
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.left,
            " Result ready",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            textAlign: TextAlign.center,
            "your result is ready now, you can get your document from our clinic!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class AppoiSituation {
  final String? appoState;
  final String? indications;
  final String? rejectionReason;
  final int? price;
  final String? date;
  final String? time;
  final int? patientsNumBefore;

  AppoiSituation({
    required this.appoState,
    required this.date,
    required this.time,
    required this.patientsNumBefore,
    required this.price,
    required this.indications,
    required this.rejectionReason,
  });
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

  Text userMessage({String message = "stay healthy, with MedPoint!"}) {
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

class AppointmentDetailsPage extends StatelessWidget {
  final String date;
  final String time;
  final String indications;
  final int price;

  const AppointmentDetailsPage({
    Key? key,
    required this.date,
    required this.time,
    required this.indications,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Date:',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  '$date 2024',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Time:',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  time,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Price:',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  '$price DA',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Indications:',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              indications,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class RejectionReasonPage extends StatelessWidget {
  final String reason;

  const RejectionReasonPage({Key? key, required this.reason}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refused appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Container(
          width: 400,
          child: Column(
            children: [
              SizedBox(height: 15),
              Text(
                'Reason for Rejection:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                reason,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
