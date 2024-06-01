import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xinner/home/widgets.dart/articles_horizontal_list.dart';
import 'package:xinner/home/widgets.dart/services_horizontal_list.dart';
import 'package:xinner/home/widgets.dart/upcoming_appointment.dart';
import 'package:xinner/utils/constants/my_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';
  String _profilePictureUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      String? fullName = userData['name'];
      if (fullName != null && fullName.isNotEmpty) {
        List<String> nameParts = fullName.split(' ');
        _username = nameParts.first;
      } else {
        _username = '';
      }

      _profilePictureUrl = userData['profilePicture'] ?? '';

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: kVerticalPadding),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, $_username 👋️",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "stay healthy, with MedPoint!",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: _profilePictureUrl.isNotEmpty
                          ? CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(_profilePictureUrl),
                            )
                          : CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("assests/images/photo.jpeg"),
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  "Your upcoming appointment",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 12),
                UpcomingAppointment(),
                SizedBox(height: 20),
                Text(
                  "Our services",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 17),
                ServicesHorizontalList(),
                SizedBox(height: 20),
                Text(
                  "Articles",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 17),
                ArticlesHorizontalList(),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

