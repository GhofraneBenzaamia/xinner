// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xinner/patient_ui/screens/EditProfile.dart';
import 'package:xinner/patient_ui/screens/ChangePassword.dart';
import 'package:xinner/patient_ui/screens/Log_Out.dart';
import 'package:stup/screens/TCollors.dart';
import 'package:stup/screens/THelperFunctions.dart';
import 'package:xinner/patient_ui/screens/history.dart';
import 'package:xinner/patient_ui/screens/security.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: SettingPageUI(),
    );
  }
}

class SettingPageUI extends StatefulWidget {
  @override
  SettingPageUIState createState() => SettingPageUIState();
}

class SettingPageUIState extends State<SettingPageUI> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
     double paddingValue = screenWidth * 0.02;
     double sizedBoxHeight = screenHeight * 0.018;
     double sizedBoxWidth = screenWidth * 0.02;
     double fontSize = screenWidth * 0.06;
     double boxHeight = screenHeight * 0.02;
     double boxHeight1 = screenHeight * 0.1;
     double borderRadius = screenWidth * 0.02;
     double paddingRight = screenWidth * 0.012;
     double paddingTop = screenHeight * 0.01;
       double radiusFactor = screenWidth * 0.07;
       double widthFactor = screenWidth * 0.02;
        double heightFactor = screenHeight * 0.01;
         double fontSizeFactor = screenWidth * 0.05;
          double heightFactor1 = screenHeight * 0.03;
          double widthFactor1 = screenWidth * 0.02;
          // double fontSize1 = screenWidth * 0.06;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "      Profile Settings ",
          style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
      body: Container(
          
        padding:  EdgeInsets.all(paddingValue),
        child: Expanded(
          child: ListView(
            children: [
                SizedBox(height: sizedBoxHeight),
              Expanded(
                child: Row(children: [
                  Icon(
                  Icons.person,
                  color: Colors.blue,
                  ),
                  SizedBox(width: sizedBoxWidth),
                  Text("Account", style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),)
                ],),
              ),
              SizedBox(height: boxHeight),
              Container(
                height: boxHeight1,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: THelperFunctions.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.grey,
          
                
            ),
            
                child: Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding( padding: EdgeInsets.only(right: paddingRight, top: paddingTop),),
                      Center(
                        
                        child: CircleAvatar(
                            
                          radius: radiusFactor,
                          backgroundImage: AssetImage('images/pict.png'),
                        ),
                      ),
                      SizedBox(  width: widthFactor,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('Karim Benzema', style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizeFactor  ),),
                          SizedBox( height: heightFactor ),
                          Text('Karimbenzi9@gmail.com'),
                          
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
            
              ),
                SizedBox(height: heightFactor1),
              Expanded(
                child: Row(children: [
                  
                  SizedBox(width: widthFactor1),
                  Text("General", style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),)
                ],),
              ),
          
           //   Divider(height: 20, thickness: 1, color: Colors.black,),
            
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
          
              color: THelperFunctions.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.grey,
            ),
            child: Expanded(
              child: Column(
                children: [
                  buildAccountOption(context, Icons.person, "Edit Profile", "Change profile picture, email",EditProfile()),
                 SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                        
                  buildAccountOption(context, Icons.lock, "Change Password", "Update account security",ChangePassword()),
                 SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                        
                  buildAccountOption(context, Icons.history, "History", "See your history",history()),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                        
                  buildAccountOption(context, Icons.security_outlined, "Terms of Use", "Protect your account now",security()),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        
                ],
              ),
            ),
            
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.033),
          
           
              Expanded(
                child: Row(children: [
                  
                 SizedBox(width: MediaQuery.of(context).size.width * 0.033),
                          
                  Text("Preferences", style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          
                ],),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          
            Container(
            
                decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
          
            color: THelperFunctions.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.grey,
                ),
                child: Expanded(
                  child: Column(
                            children: [
                            
                              buildAccountOption(context, Icons.logout, "Log Out", "log out of account", Log_Out()),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            
                            ],
                  ),
                ),
              ),
            ],
          ),
        ),


        ),
      );
    
  }

  GestureDetector buildAccountOption(BuildContext context, IconData icon, String title, String description, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Padding(
      padding: EdgeInsets.symmetric(
  vertical: MediaQuery.of(context).size.height * 0.01,
  horizontal: MediaQuery.of(context).size.width * 0.04,
),

      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(icon, color: Colors.grey[600], size: MediaQuery.of(context).size.width * 0.06,),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04, color: const Color.fromARGB(255, 33, 7, 7)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[600]),
          ],
        ),
      ),
    ),
  );
}
}
