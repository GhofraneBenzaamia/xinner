// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xinner/utils/constants/colors.dart';
import 'package:xinner/utils/helper_functions.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileStaate createState() => _EditProfileStaate();
}

class _EditProfileStaate extends State<EditProfile> {
  Uint8List? _image;
  bool isObscurePassword = true;
  //final TextEditingController fullnamcontroller = TextEditingController();

  void selectImage() async {
    // Uint8List img = await pickImage(ImageSource.gallery);
    // setState(() {
    //   _image = img;
    // });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    EdgeInsets padding = EdgeInsets.only(
      left: screenWidth * 0.046, // 15/326 pour la largeur de l'écran
      top: screenHeight * 0.061, // 20/326 pour la hauteur de l'écran
      right: screenWidth * 0.046,
    ); // 15/326 pour la largeur de l'écran

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '      Edit Profile Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.grey,
      ),
      body: Container(
        //  color: Colors.grey,
        color: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.grey,
        padding: padding,
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
                        _image != null
                            ? Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: MemoryImage(_image!),
                                      fit: BoxFit.cover),
                                ),
                              )
                            : Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1)),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/pict.png'),
                                    )),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                color: Colors.blue,
                              ),
                              child: IconButton(
                                onPressed: selectImage,
                                icon: Center(
                                    child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                buildTextField("Full Name", "Karim Benzema", false),
                buildTextField("Email", "Karimbenzi9@gmail.com", false),
                buildTextField("Phone Number", "0778323114", false),
                buildTextField("Location", "Madrid", false),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.black),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? true : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 15, 11, 11),
          ),
        ),
      ),
    );
  }
}
