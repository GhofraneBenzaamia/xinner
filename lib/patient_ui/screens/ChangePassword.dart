
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:stup/screens/TCollors.dart';
import 'package:stup/screens/THelperFunctions.dart';
class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('     Edit Password Page', style: TextStyle( fontWeight: FontWeight.bold),),
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
            color: const Color.fromARGB(255, 33, 1, 1),
            ),
            onPressed: () {
                Navigator.pop(context);
            },
            ),
           backgroundColor: THelperFunctions.isDarkMode(context)
        ? TColors.darkGrey
        : TColors.grey, 
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
                child: Expanded(
                  child: ListView(
                              children: [
                                Center(
                  child: Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1)
                            ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/cadna.png'),
                            )
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                        
                            
                          ),
                        ),
                      
                      
                      ],
                    ),
                  ),
                  ),
                                SizedBox(height: 30,),
                                buildTextField("Old Password", "**********", true),
                                SizedBox( height: 30,),
                                buildTextField("New Password", "...........", true),
                                SizedBox(height: 8,),
                                buildTextField("Confirm your new password", ".........", true),
                                
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text("Cancel", style: TextStyle(fontSize: 15, letterSpacing: 2,color: Colors.black),),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                    
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Save", style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                              color: Colors.white,
                    
                            ),),
                            style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                            ),
                            ),
                      ],
                    ),
                  ),
                  
                              ],
                            ),
                ),
        ),
      
      color: THelperFunctions.isDarkMode(context)
        ? TColors.darkGrey
        : TColors.grey,
      ),
    );
  }
 Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
      obscureText: isPasswordTextField ? true : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                onPressed: () {},
              )
            : null,
        contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 22,
       //   fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}

}
