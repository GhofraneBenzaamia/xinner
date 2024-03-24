import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointScreen extends StatefulWidget {
  @override
  State<AppointScreen> createState() => _AppointScreenState();
}

class _AppointScreenState extends State<AppointScreen> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  List<String> scheduleList = [
    "Sunday    08:00-18:00",
    "Monday    08:00-18:00",
    "Tuesday   08:00-18:00",
    "Wednesday 08:00-18:00",
    "Thursday  08:00-18:00",
    "Friday    closed",
    "Saturday  08:00-18:00",
  ];

  // Define a list to hold the specialties
  List<String> specialties = [
    "Rardiologist",
    "Generalist",
    "Doctor",
    "Professor",
    "Medicine"
  ];

  Widget _buildBox(String text, IconData iconData) {
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
            size: 20.0,
          ),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack
            Stack(
              children: [
                // Clipped image
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/doctor.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Texts below clipped image
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.51,
                  left: 1,
                  right: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Doctor Amine",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "Radiologiste",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            final Uri url = Uri(
                              scheme: "tel",
                              path: "2137698567",
                            );
                            if (await canLaunch(url.toString())) {
                              await launch(url.toString());
                            } else {
                              print("Cannot launch this URL");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            launchGoogleMaps(
                                36.477919132800174, 2.8200227356094896);
                            print("Phone icon pressed");
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[600],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.place,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Patient information boxes
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.60,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Experience",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "✨",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(" "),
                                Text(
                                  "10 years",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Patients",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "😷",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(" "),
                                Text(
                                  "8000+",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Biography title and text
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biography",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Dr. Amine: Radiologist Extraordinaire. A decade of mastery. Precision meets compassion. Excellence defined. Renowned for transforming diagnostics. A visionary leader in healthcare innovation.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Specialties title
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Specialties",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 8),
            // ListView for Specialties
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specialties.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        specialties[index],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 15),

            // Practice Location title
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Cabinet Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageCarousel(images: [
                      "assets/picture1.png",
                      "assets/picture2.png",
                      "assets/picture3.png",
                      "assets/picture4.png",
                      "assets/picture5.png",
                      // Add more image paths as needed
                    ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 10, 8.0, 0),
                      child: Text(
                        'Amenities',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Change to MainAxisAlignment.start
                        children: [
                          SizedBox(width: 10), // Add space at the beginning
                          _buildBox('WI-FI', Icons.wifi),
                          SizedBox(width: 10), // Add space between amenities
                          _buildBox('Air conditioning', Icons.ac_unit),
                          SizedBox(width: 10), // Add space between amenities
                          _buildBox(
                              'Waiting Area',
                              Icons
                                  .chair_rounded), // Add more amenities as needed
                          SizedBox(width: 10),
                          _buildBox('Parking', Icons.local_parking),
                          SizedBox(width: 10), // Add space at the end
                        ],
                      ),
                    ),
                    SizedBox(height: 18.0),
                    ExpandableSection(
                      icon: Icons.access_time,
                      title: 'Time',
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.white,
                              ), // Time icon
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Divider(color: Colors.grey[400]),
                          ),
                          // Define the schedule for each day
                          for (String schedule in scheduleList)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                schedule,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ExpandableSection(
              icon: Icons.place_outlined,
              title: 'Address',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "19 cite ferhat rue ouali mohamed , Blida ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Your content for the Description section here
                ],
              ),
            ),
            ExpandableSection(
              icon: Icons.mail_outline,
              title: 'Email',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "radiologyclinic@example.com",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper Class for Waved Effect
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.66);
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.75, size.width / 2, size.height * 0.66);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 0.57, size.width, size.height * 0.66);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

void launchGoogleMaps(double latitude, double longitude) {
  MapsLauncher.launchCoordinates(latitude, longitude, 'Google Maps Location');
}

class ExpandableSection extends StatefulWidget {
  final IconData icon;
  final String title;
  final Widget content;

  ExpandableSection(
      {required this.icon, required this.title, required this.content});

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      size: 23, // Increased icon size
                    ),
                    SizedBox(width: 8),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19, // Modified text size
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: _isExpanded
                    ? Icon(Icons.expand_less, color: Colors.grey)
                    : Icon(Icons.expand_more, color: Colors.black),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.all(15),
              child: widget.content,
            ),
        ],
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<String>? images;

  ImageCarousel({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images == null || images!.isEmpty) {
      // Return a placeholder widget or an empty container if images list is null or empty
      return Container();
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.width *
          0.5, // Adjust the height to display two images
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images!.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 18.0); // Adjust spacing between squares
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width:
                MediaQuery.of(context).size.width * 0.5, // Adjust square size
            height:
                MediaQuery.of(context).size.width * 0.5, // Adjust square size
            decoration: BoxDecoration(
              color: Colors.grey[300], // Placeholder color for the square
              borderRadius: BorderRadius.circular(12), // Apply border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 2), // Shadow offset
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Clip rounded corners
              child: Image.asset(
                images![
                    index], // Use null-aware operator to access list element
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
