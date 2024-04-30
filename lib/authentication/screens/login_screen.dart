import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:xinner/control_view.dart';
import 'package:xinner/patient_ui/screens/doctor_ui.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xinner/authentication/data/role.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xinner/controllers/auth_controller.dart';
import 'package:xinner/patient_ui/screens/doctor.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xinner/authentication/screens/forget_password_screen%20copy.dart';
import 'package:xinner/authentication/screens/home.dart';
import 'package:xinner/patient_ui/screens/profile/UserSetting.dart';
import 'package:xinner/patient_ui/screens/profile/security.dart';
import 'package:xinner/patient_ui/screens/profile/EditProfile.dart';
import 'package:xinner/authentication/screens/sign_in_screen.dart';
import 'package:xinner/authentication/screens/sucsses_screen.dart';

import 'package:xinner/utils/constants/colors.dart';
import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/utils/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
          //top: 3,
          left: TSizes.defaultSpace,
          // bottom: TSizes.defaultSpace,
          right: TSizes.defaultSpace,
        ),
        child: Column(
          children: [
            SizedBox(height: THelperFunctions.screenHeight() * 0.2),
            LoginHeader(),
            SizedBox(height: TSizes.defaultSpace),
            LoginForm(),
            LogingDivider(),
            SizedBox(height: 8),
            LoginSocialIcons()
          ],
        ),
      )),
    );
  }
}

class LoginSocialIcons extends StatelessWidget {
  const LoginSocialIcons({
    super.key,
  });
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.off(ControlView());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {
                signInWithGoogle();
              },
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage("assests/images/google-icon.png"),
              )),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage("assests/images/facebook-icon.png"),
              )),
        )
      ],
    );
  }
}

class LogingDivider extends StatelessWidget {
  const LogingDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        GestureDetector(
          onTap: () async {
            await FirebaseMessaging.instance
                .getToken()
                .then((value) => print("DEVICE TOKEN :" + value.toString()));
          },
          child: Text(
            "Or sign in with",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Flexible(
            child: Divider(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        )),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool isVisible = true;
  TextEditingController passwordController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  String email = " ", password = " ";
  bool _isLoading = false;
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        children: [
          TextFormField(
            validator: (Value) {
              if (Value?.isEmpty == true) return 'please enter your email';
            },
            onChanged: (value) => email = value,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: "email"),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: isVisible,
            controller: passwordController,
            validator: (Value) {
              if (Value?.isEmpty == true) return 'please enter the password';
            },
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              labelText: "password",
              suffixIcon: GestureDetector(
                  onTap: () => setState(() {
                        isVisible = !isVisible;
                      }),
                  child: isVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text("remember me")
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => ForgetPassword());
                  },
                  child: const Text("forget password?"))
            ],
          ),
          const SizedBox(height: 8),
          // Define a boolean variable to control the visibility of the progress indicator

          GetBuilder<AuthController>(
            builder: (controller) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true; // Show the progress indicator
                    });

                    if (formState.currentState!.validate()) {
                      try {
                        controller.signInWithEmailAndPassword(email, password);
                        // final credential = await FirebaseAuth.instance
                        //     .signInWithEmailAndPassword(
                        //   email: email,
                        //   password: password,
                        // );
                        // if (credential.user != null &&
                        //     credential.user!.emailVerified) {
                        //   CheckUserRole(user);
                        // }
                        setState(() {
                          _isLoading = false;
                        });
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          _isLoading = false;
                        });
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('User not found '),
                            ),
                          );
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Wrong password!'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: const Text(
                                  'Authentication error , try later'),
                            ),
                          );
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('email not verified'),
                        ),
                      );
                      // Handle scenario where email is not verified or user is null
                    }
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator() // Show the progress indicator
                      : const Text("SignIn"),
                ),
              );
            },
          ),

          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       setState(() {
          //         _isLoading = true; // Show the progress indicator
          //       });

          //       if (formState.currentState!.validate()) {
          //         try {
          //           final credential =
          //               await FirebaseAuth.instance.signInWithEmailAndPassword(
          //             email: email,
          //             password: password,
          //           );

          //           if (credential.user != null &&
          //               credential.user!.emailVerified) {
          //             if (email == "tba19022@gmail.com") {
          //               Get.off(DoctorUi());
          //             } else {
          //               Get.off(formulaire());
          //             }
          //           }
          //           setState(() {
          //             _isLoading = false;
          //           });
          //         } on FirebaseAuthException catch (e) {
          //           setState(() {
          //             _isLoading = false;
          //           });
          //           if (e.code == 'user-not-found') {
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               const SnackBar(
          //                 backgroundColor: Colors.red,
          //                 content: Text('User not found '),
          //               ),
          //             );
          //           } else if (e.code == 'wrong-password') {
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               const SnackBar(
          //                 backgroundColor: Colors.red,
          //                 content: Text('Wrong password!'),
          //               ),
          //             );
          //           } else {
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               const SnackBar(
          //                 backgroundColor: Colors.red,
          //                 content:
          //                     const Text('Authentication error , try later'),
          //               ),
          //             );
          //           }
          //         }
          //       } else {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             backgroundColor: Colors.red,
          //             content: Text('email not verified'),
          //           ),
          //         );
          //         // Handle scenario where email is not verified or user is null
          //       }
          //     },
          //     child: _isLoading
          //         ? const CircularProgressIndicator() // Show the progress indicator
          //         : const Text("SignIn"),
          //   ),
          // ),

          const SizedBox(height: 8),
          TextButton(
              onPressed: () {
                Get.to(() => const SignInScreen());
              },
              child: const Text("you don't have an account ?"))
        ],
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Image.asset(
        'assests/images/Minimalist Blue Medical Logo(1)Croped.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
