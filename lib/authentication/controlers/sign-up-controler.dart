import 'package:flutter/material.dart';

class SignUpControler extends StatefulWidget{


  @override
  State <SignUpControler> createState() => SignUpControlerState();
}

class SignUpControlerState extends  State<SignUpControler>{

  final TextEditingController email = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    password.dispose();
    userName.dispose();
    phoneNumber.dispose();
    return Container();
   
  }

}