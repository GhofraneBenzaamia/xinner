import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xinner/authentication/screens/login_screen.dart';
import 'package:xinner/authentication/screens/email_verification_screen.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SignUpFormState extends State<SignUpForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _fullName = "";
  String _email = "";
  String _password = "";
  bool _isChecked = false;
  bool _isPasswordVisible = false;

  void _createUserInFirestore(String fullName, String email) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': fullName,
          'email': email,
        });
      }
    } catch (e) {
      print('Error creating user document: $e');
      // Handle any errors that occur during Firestore user creation
    }
  }

  void _submitForm() async {
    if (!_isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('You must agree to the privacy policy and terms.'),
      ));
      return;
    }

    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _email.trim(),
          password: _password,
        );

        // Store user data in Firestore after successful signup
        _createUserInFirestore(_fullName.trim(), _email.trim());

        // Send email verification
        await userCredential.user!.sendEmailVerification();

        // Navigate to email verification screen
        Get.to(() => VerifyEmailScreen());
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid email or email already in use.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (value) => _fullName = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: TSizes.defaultSpace),
          TextFormField(
            onChanged: (value) => _email = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.endsWith('@gmail.com')) {
                return 'Invalid email format';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.defaultSpace),
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            onChanged: (value) => _password = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                  .hasMatch(value)) {
                return 'Password must contain at least one uppercase letter, one number, one special character, and be at least 6 characters long';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(_isPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
            ),
          ),
          const SizedBox(height: TSizes.defaultSpace),
          CheckboxListTile(
            title: Text.rich(
              TextSpan(
                text: 'I Agree to ',
                children: [
                  TextSpan(
                    text: 'Privacy Policy ',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: 'and '),
                  TextSpan(
                    text: 'Terms of Use',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
          const SizedBox(height: TSizes.defaultSpace),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Create Account'),
            ),
          ),
          const SizedBox(height: TSizes.defaultSpace),
          TextButton(
            onPressed: () {
              Get.to(() => const LoginScreen());
            },
            child: const Text('Already have an account?'),
          ),
        ],
      ),
    );
  }
}
