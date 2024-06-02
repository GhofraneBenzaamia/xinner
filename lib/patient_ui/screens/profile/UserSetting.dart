import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xinner/patient_ui/screens/profile/EditProfile.dart';
import 'package:xinner/patient_ui/screens/profile/ChangePassword.dart';
import 'package:xinner/patient_ui/screens/profile/History.dart';
import 'package:xinner/patient_ui/screens/profile/security.dart';

class SettingPageUI extends StatefulWidget {
  @override
  _SettingPageUIState createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingPageUI> {
  String? _profilePictureUrl;

  Future<void> _signOutUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      print('No user is currently signed in.');
    }
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _signOutUser(); // Perform log out
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROFILE SETTING",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true, // Center the title horizontally
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(
              child: Text("No user data found"),
            );
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;

          // Use _profilePictureUrl if available, otherwise fallback to userData
          String? profilePictureUrl =
              _profilePictureUrl ?? userData['profilePicture'];

          // Convert profilePictureUrl to ImageProvider
          ImageProvider<Object>? profileImage;
          if (profilePictureUrl != null) {
            profileImage = NetworkImage(profilePictureUrl);
          } else {
            profileImage = AssetImage('assets/images/default_profile.png');
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Account section with profile picture
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800]
                          : Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: profileImage,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData['name'] ?? 'Name not available',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                                softWrap: true,
                              ),
                              SizedBox(height: 5),
                              Text(
                                userData['email'] ?? 'Email not available',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // General settings section with options
                  _buildSectionWithTitle(
                    "General",
                    Colors.green,
                    Column(
                      children: [
                        _buildAccountOption(
                          context,
                          Icons.person,
                          "Edit Profile",
                          "Change profile picture, email",
                          EditProfile(),
                        ),
                        _buildAccountOption(
                          context,
                          Icons.lock,
                          "Change Password",
                          "Update account security",
                          ChangePassword(),
                        ),
                        _buildAccountOption(
                          context,
                          Icons.history,
                          "History",
                          "See your history",
                          HistoryPage(),
                        ),
                        _buildAccountOption(
                          context,
                          Icons.security_outlined,
                          "Security",
                          "Terms of Use",
                          SecurityScreen(),
                          //SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Preferences section
                  _buildSectionWithTitle(
                    "Preferences",
                    Colors.orange,
                    Column(
                      children: [
                        _buildAccountOption(
                          context,
                          Icons.logout,
                          "Log Out",
                          "Log out of account",
                          null, // You can implement logout logic directly in _buildAccountOption
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionWithTitle(
      String title, Color backgroundColor, Widget content) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildAccountOption(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    Widget? page,
  ) {
    return ListTile(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          _showLogoutConfirmationDialog(); // Show logout confirmation dialog
        }
      },
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.grey[600],
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 33, 7, 7),
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[600]),
    );
  }
}
